//
//  AppCoordinatorTests.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-04-11.
//

import XCTest
@testable import ToDo

final class AppCoordinatorTests: XCTestCase {
  
  var sut: AppCoordinator!
  var navigationControllerMock: NavigationControllerMock!
  var window: UIWindow!

    override func setUpWithError() throws {
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
      navigationControllerMock = NavigationControllerMock()
      sut = AppCoordinator(window: window,
      navigationController: navigationControllerMock)
    }

    override func tearDownWithError() throws {
      sut = nil
      navigationControllerMock = nil
      window = nil
    }

  func test_start_shouldSetDelegate() throws {
    
    sut.start()
    let listViewController = try XCTUnwrap(navigationControllerMock.lastPushedViewController as? ToDoItemsListViewController)
    XCTAssertIdentical(listViewController.delegate as? AppCoordinator, sut)
  }

  func test_start_shouldAssignItemStore() throws {
    sut.start()
    let listViewController = try XCTUnwrap(navigationControllerMock.lastPushedViewController as? ToDoItemsListViewController)
    XCTAssertNotNil(listViewController.toDoItemStore)
  }
  
  func test_selectToDoItem_pushesDetails() throws {
    let dummyViewController = UIViewController()
    let item = ToDoItem(title: "dummy title")
    sut.selectToDoItem(dummyViewController, item: item)
    let detail = try XCTUnwrap(navigationControllerMock.lastPushedViewController as? ToDoItemDetailsViewController)
    XCTAssertEqual(detail.toDoItem, item)
  }
}
