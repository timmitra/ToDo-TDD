//
//  ToDoItemInputViewDelegateMock.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-04-10.
//

import Foundation
import XCTest
@testable import ToDo

class ToDoItemInputViewDelegateMock: ToDoItemInputViewDelegate {
  var lastToDoItemData: ToDoItemData?
  var lastCoordinate: Coordinate?
  func addToDoItem(with data: ToDoItemData, coordinate: Coordinate?) {
    lastToDoItemData = data
    lastCoordinate = coordinate
  }
}
