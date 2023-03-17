//
//  ToDoItemStoreTests.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-03-10.
//

import XCTest
@testable import ToDo
import Combine

final class ToDoItemStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func test_add_shouldPublishChange() throws {
    let sut = ToDoItemStore()
    let todoItem = ToDoItem(title: "Dummy")
    let receivedItems = try wait(for: sut.itemPublisher) {
      sut.add(todoItem)
    }
    XCTAssertEqual(receivedItems, [todoItem])
  }
}

extension XCTestCase {
  func wait<T: Publisher>(
    for publisher: T,
    afterChange change: () -> Void) throws -> T.Output where T.Failure == Never {
    let publisherExpectation = expectation(
      description: "Wait for publisher in \(#file)"
    )
    var result: T.Output?
    let token = publisher
      .dropFirst()
      .sink { value in
        result = value
        publisherExpectation.fulfill()
      }
      change()
    wait(for: [publisherExpectation], timeout: 1)
    token.cancel()
    let unwrappedResult = try XCTUnwrap(
      result,
    "Publisher did not publish any value"
    )
  return unwrappedResult
  }
}
