//
//  ToDoItemsListViewControllerTests.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-03-21.
//

import XCTest
@testable import ToDo

final class ToDoItemsListViewControllerTests: XCTestCase {

  var sut: ToDoItemsListViewController!
  var toDoItemStoreMock: ToDoItemStoreProtocolMock!

    override func setUpWithError() throws {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      sut = try XCTUnwrap(storyboard.instantiateInitialViewController() as? ToDoItemsListViewController)
      toDoItemStoreMock = ToDoItemStoreProtocolMock()
      sut.toDoItemStore = toDoItemStoreMock
      sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        
      sut = nil
    }

  func test_shouldBeSetup() {
    XCTAssertNotNil(sut)
  }
  
  func test_shouldHaveTableView() {
    XCTAssertTrue(sut.tableView.isDescendant(of: sut.view))
  }
  
  func test_numberOfRows_whenOneItemIsSent_shouldReturnOne() {
    toDoItemStoreMock.itemPublisher.send([
      ToDoItem(title: "dummy 1")
    ])
    let result = sut.tableView.numberOfRows(inSection: 0)
    XCTAssertEqual(result, 0)
  }
  
  func test_numberOfRows_whenOneItemIsSent_shouldReturnTwo() {
    toDoItemStoreMock.itemPublisher.send([
      ToDoItem(title: "dummy 1"),
      ToDoItem(title: "dummy 2")
    ])
    let result = sut.tableView.numberOfRows(inSection: 0)
    XCTAssertEqual(result, 0)
  }
}
