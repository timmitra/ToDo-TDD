//
//  APIClientMock.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-04-04.
//

import Foundation
@testable import ToDo

class APIClientMock: APIClientProtocol {
  var coordinateAddress: String?
  var coordinateReturnValue: Coordinate?
  func coordinate(
    for address: String,
    completion: (Coordinate?) -> Void) {
      coordinateAddress = address
      completion(coordinateReturnValue)
  }
}
