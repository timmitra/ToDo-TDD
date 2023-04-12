//
//  AppSetupTests.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-04-11.
//

import XCTest
@testable import ToDo

class AppSetupTests: XCTestCase {

  func test_application_shouldSetupRoot() throws {
    let application = UIApplication.shared
    let scene = application.connectedScenes.first as? UIWindowScene
    let root = scene?.windows.first?.rootViewController
    let nav = try XCTUnwrap(root as?
        UINavigationController)
    XCTAssert(nav.topViewController is ToDoItemsListViewController)
  }

}
