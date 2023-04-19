//
//  ToDoItemsListViewControllerProtocolMock.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-03-24.
//

import UIKit
@testable import ToDo

class ToDoItemsListViewControllerProtocolMock: ToDoItemsListViewControllerProtocol {
  
  var selectToDoItemReceivedArguments: (viewController: UIViewController, item: ToDoItem)?
  var addToDoItemCallCount = 0
  
  func selectToDoItem(_ viewController: UIViewController, item: ToDoItem) {
    selectToDoItemReceivedArguments = (viewController, item)
  }
  
  func addToDoItem(_ viewController: UIViewController) {
    addToDoItemCallCount += 1
  }
}
