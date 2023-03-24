//
//  ToDoItemDetailsViewControllerTests.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-03-24.
//

import XCTest
@testable import ToDo

final class ToDoItemDetailsViewControllerTests: XCTestCase {
  
  var sut: ToDoItemDetailsViewController!

    override func setUpWithError() throws {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
     sut = (storyboard.instantiateViewController(withIdentifier: "ToDoItemDetailsViewController") as! ToDoItemDetailsViewController)
      sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
      sut = nil
    }

  func test_view_shouldHaveTitleLabel() throws {
    let subView = try XCTUnwrap(sut.titleLabel)
    XCTAssertTrue(subView.isDescendant(of: sut.view))
  }
  
  func test_view_shouldHaveDateLabel() throws {
    let subview = try XCTUnwrap(sut.dateLabel)
    XCTAssertTrue(subview.isDescendant(of: sut.view))
  }
  
  func test_view_shouldHaveLocationLabel() throws {
    let subview = try XCTUnwrap(sut.locationLabel)
    XCTAssertTrue(subview.isDescendant(of: sut.view))
  }
  
  func test_view_shouldHaveDescriptionLabel() throws {
    let subview = try XCTUnwrap(sut.descriptionLabel)
    XCTAssertTrue(subview.isDescendant(of: sut.view))
  }
  
  func test_view_shouldHaveMapView() throws {
    let subview = try XCTUnwrap(sut.mapView)
    XCTAssertTrue(subview.isDescendant(of: sut.view))
  }
  
  func test_view_shouldHaveDoneButton() throws {
    let subview = try XCTUnwrap(sut.doneButton)
    XCTAssertTrue(subview.isDescendant(of: sut.view))
  }
}
