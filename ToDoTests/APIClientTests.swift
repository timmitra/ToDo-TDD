//
//  APIClientTests.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-04-11.
//

import XCTest
@testable import ToDo

final class APIClientTests: XCTestCase {
  
  var sut: APIClient!

    override func setUpWithError() throws {
        sut = APIClient()
    }

    override func tearDownWithError() throws {
      sut = nil
    }
}
