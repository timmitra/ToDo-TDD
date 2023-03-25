//
//  ToDoItemDetailsViewControllerTests.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-03-24.
//

import XCTest
@testable import ToDo

final class ToDoItemDetailsViewControllerTests: XCTestCase {
  
  var sut: ToDoItemDetailsViewController!

    override func setUpWithError() throws {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
     sut = (storyboard.instantiateViewController(withIdentifier: "ToDoItemDetailsViewController") as! ToDoItemDetailsViewController)
      sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
      sut = nil
    }

  func test_view_shouldHaveTitleLabel() throws {
    let subView = try XCTUnwrap(sut.titleLabel)
    XCTAssertTrue(subView.isDescendant(of: sut.view))
  }
  
  func test_view_shouldHaveDateLabel() throws {
    let subview = try XCTUnwrap(sut.dateLabel)
    XCTAssertTrue(subview.isDescendant(of: sut.view))
  }
  
  func test_view_shouldHaveLocationLabel() throws {
    let subview = try XCTUnwrap(sut.locationLabel)
    XCTAssertTrue(subview.isDescendant(of: sut.view))
  }
  
  func test_view_shouldHaveDescriptionLabel() throws {
    let subview = try XCTUnwrap(sut.descriptionLabel)
    XCTAssertTrue(subview.isDescendant(of: sut.view))
  }
  
  func test_view_shouldHaveMapView() throws {
    let subview = try XCTUnwrap(sut.mapView)
    XCTAssertTrue(subview.isDescendant(of: sut.view))
  }
  
  func test_view_shouldHaveDoneButton() throws {
    let subview = try XCTUnwrap(sut.doneButton)
    XCTAssertTrue(subview.isDescendant(of: sut.view))
  }
  
  func test_settingToDoItem_shouldUpdateTitleLabel() {
    let title = "dummy title"
    let toDoItem = ToDoItem(title: title)
    sut.toDoItem = toDoItem
    XCTAssertEqual(sut.titleLabel.text, title)
  }
  func test_settingToDoItem_shouldUpdateDateLabel() {
    let date = Date()
    let toDoItem = ToDoItem(title: "dummy title", timestamp: date.timeIntervalSince1970)
    sut.toDoItem = toDoItem
    XCTAssertEqual(sut.dateLabel.text, sut.dateFormatter.string(from: date))
  }
  func test_settingToDoItem_shouldUpdateDescriptionLabel() {
    let description = "dummy discription"
    let toDoItem = ToDoItem(title: "dummy title", itemDescription: description)
    sut.toDoItem = toDoItem
    XCTAssertEqual(sut.descriptionLabel.text, description)
  }
  func test_settingToDoItem_shouldUpdateLocationLabel() {
    let location = "dummy location"
    let toDoItem = ToDoItem(title: "dummy title", location: Location(name: location))
    sut.toDoItem = toDoItem
    XCTAssertEqual(sut.locationLabel.text, location)
  }
}
