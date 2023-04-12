//
//  APIClientTests.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-04-11.
//

import XCTest
@testable import ToDo
import Intents
import Contacts

final class APIClientTests: XCTestCase {
  
  var sut: APIClient!

    override func setUpWithError() throws {
        sut = APIClient()
    }

    override func tearDownWithError() throws {
      sut = nil
    }
  
  func test_coordinate_fetchesCoordinate() {
    let geoCoderMock = GeoCoderProtocolMock()
    sut.geocoder = geoCoderMock
    let location = CLLocation(latitude: 1, longitude: 2)
    let placemark = CLPlacemark(location: location, name: nil, postalAddress: nil)
    let expectedAddress = "dummy address"
    var result: Coordinate?
    sut.coordinate(for: "") { coordinate in
     result = coordinate
    }
   geoCoderMock.completionHandler?([placemark], nil)
    XCTAssertEqual(result?.latitude, location.coordinate.latitude)
    XCTAssertEqual(result?.longitude, location.coordinate.longitude)
  }
  
  func test_coordinate_shouldCallGeoCoderWithAddress() {
    let geoCoderMock = GeoCoderProtocolMock()
    sut.geocoder = geoCoderMock
    let expectedAddress = "dummy address"
    sut.coordinate(for: expectedAddress) { _ in
    }
    XCTAssertEqual(geoCoderMock.geocodeAddressString, expectedAddress)
  }
  
  func test_toDoItems_shouldFetchedItems() async throws {
    let url = try XCTUnwrap(URL(string: "http://toodoo.app/items"))
    let urlSessionMock = URLSessionProtocolMock()
    let expected = [ToDoItem(title: "dummy title")]
    urlSessionMock.dataForDelegateReturnValue = (
      try JSONEncoder().encode(expected),
      HTTPURLResponse(url: url,
                      statusCode: 200,
                     httpVersion: "HTTP/1.1",
                     headerFields: nil)!
    )
    sut.session = urlSessionMock
    let items = try await sut.toDoItems()
    XCTAssertEqual(items, expected)
    XCTAssertEqual(urlSessionMock.dataForDelegateRequest, URLRequest(url: url))
  }
  
  func test_toDoItems_whenError_shouldPassError() async throws {
    let urlSessionMock = URLSessionProtocolMock()
    let expected = NSError(domain: "", code: 1234)
    urlSessionMock.dataForDelegateError = expected
    sut.session = urlSessionMock
    do {
      _ = try await sut.toDoItems()
      XCTFail()
    } catch {
      let nsError = try XCTUnwrap(error as NSError)
      XCTAssertEqual(nsError, expected)
    }
  }
}
