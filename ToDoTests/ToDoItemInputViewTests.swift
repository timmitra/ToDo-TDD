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
  
  func test_whenWithoutDate_shouldNotShowDateInput() {
    XCTAssertThrowsError(try sut
      .inspect()
      .find(ViewType.DatePicker.self)
    )
  }
    
  func test_shouldAllowDescriptionInput() throws {
    let expected = "dummy description"
    try sut
      .inspect()
      .find(ViewType.TextField.self,
            where: { view in
        let label = try view
          .labelView()
          .text()
          .string()
        return label == "Description"
      })
      .setInput(expected)
    let input = toDoItemData.itemDescription
    XCTAssertEqual(input, expected)
  }
  
  func test_shouldHaveASaveButton() throws {
    XCTAssertNoThrow(try sut
      .inspect()
      .find(ViewType.Button.self,
            where: { view in
      let label = try view
        .labelView()
        .text()
        .string()
      return label == "Save"
    }))
  }
}
