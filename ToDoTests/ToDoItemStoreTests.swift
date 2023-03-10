//
//  ToDoItemStoreTests.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-03-10.
//

import XCTest
@testable import ToDo

final class ToDoItemStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func test_add_shouldPublishChange() {
    let sut = ToDoItemStore()
    let publishExpectation = expectation(description: "Wait for publisher in \(#file)")
    var receivedItems: [ToDoItem] = []
    let token = sut.itemPublisher
  }
}
