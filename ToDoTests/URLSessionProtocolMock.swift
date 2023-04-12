//
//  URLSessionProtocolMock.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-04-11.
//

import Foundation
@testable import ToDo

class URLSessionProtocolMock: URLSessionProtocol {
  var dataForDelegateReturnValue: (Data, URLResponse)?
  var dataForDelegateRequest: URLRequest?
  func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
    dataForDelegateRequest = request
    guard let dataForDelegateReturnValue else {
      fatalError()
    }
    return dataForDelegateReturnValue
  }
}