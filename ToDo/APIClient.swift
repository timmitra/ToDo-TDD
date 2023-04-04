//
//  APIClient.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-04-03.
//

import Foundation

protocol APIClientProtocol {
  func coordinate(
    for: String,
    completion: (Coordinate?) -> Void
  )
}

class APIClient: APIClientProtocol {
  func coordinate(
    for: String,
    completion: (Coordinate?) -> Void) {
    
  }
}
