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

    override func setUpWithError() throws {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      sut = try XCTUnwrap(storyboard.instantiateInitialViewController() as? ToDoItemsListViewController)
      sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        
      sut = nil
    }

  func test_shouldBeSetup() {
    XCTAssertNotNil(sut)
  }
}
