//
//  ToDoItemInputViewTests.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-03-25.
//

import XCTest
@testable import ToDo
import ViewInspector
import Foundation

extension ToDoItemInputView: Inspectable {}

final class ToDoItemInputViewTests: XCTestCase {
  
  var sut: ToDoItemInputView!
  var toDoItemData: ToDoItemData!

    override func setUpWithError() throws {
      toDoItemData = ToDoItemData()
      sut = ToDoItemInputView(data: toDoItemData)
    }

    override func tearDownWithError() throws {
      sut = nil
      toDoItemData = nil
    }

  func test_titleInput_shouldSetValueInData() throws {
    let expected = "dummy title"
    try sut
      .inspect()
      .find(ViewType.TextField.self)
      .setInput(expected)
    let input = toDoItemData.title
    XCTAssertEqual(input, expected)
  }
}
