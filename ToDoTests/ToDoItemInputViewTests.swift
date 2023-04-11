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
  var apiClientMock: APIClientMock!

    override func setUpWithError() throws {
      toDoItemData = ToDoItemData()
      apiClientMock = APIClientMock()
      sut = ToDoItemInputView(data: toDoItemData, apiClient: apiClientMock)
    }

    override func tearDownWithError() throws {
      sut = nil
      toDoItemData = nil
      apiClientMock = nil
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
  
  func test_saveButton_shouldFetchCoordinate() throws {
    toDoItemData.title = "dummy title"
    let expected = "dummy address"
    toDoItemData.addressString = expected
    try sut
      .inspect()
      .find(ViewType.Button.self,
            where: { view in
        let label = try view
          .labelView()
          .text()
          .string()
        return label == "Save"
      }
      )
      .tap()
    XCTAssertEqual(apiClientMock.coordinateAddress, expected)
  }
  
  func test_save_shouldCallDelegate() throws {
    toDoItemData.title = "dummy title"
    toDoItemData.addressString = "dummy address"
    apiClientMock.coordinateReturnValue = Coordinate(latitude: 1, longitude: 2)
    let delegateMock = ToDoItemInputViewDelegateMock()
    sut.delegate = delegateMock
    try sut.tapButtonWith(name: "Save")
    XCTAssertEqual(delegateMock.lastToDoItemData?.title, "dummy title")
    XCTAssertEqual(delegateMock.lastCoordinate?.latitude, 1)
    XCTAssertEqual(delegateMock.lastCoordinate?.longitude, 2)
  }
  
  func test_save_whenAddressEmpty_shouldCallDelegate() throws {
    toDoItemData.title = "dummy title"
    apiClientMock.coordinateReturnValue = Coordinate(latitude: 1, longitude: 2)
    let delegateMock = ToDoItemInputViewDelegateMock()
    sut.delegate = delegateMock
    try sut.tapButtonWith(name: "Save")
    XCTAssertEqual(delegateMock.lastToDoItemData?.title, "dummy title")
  }
}

extension ToDoItemInputView {
  func tapButtonWith(name: String) throws {
    try inspect()
      .find(ViewType.Button.self,
            where: { view in
        let label = try view
          .labelView()
          .text()
          .string()
        return label == name
      })
      .tap()
  }
}
