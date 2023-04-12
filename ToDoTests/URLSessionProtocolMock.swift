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
  var dataForDelegateError: Error?
  
  
  func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
    if let error = dataForDelegateError {
      throw error
    }
    dataForDelegateRequest = request
    guard let dataForDelegateReturnValue else {
      fatalError()
    }
    return dataForDelegateReturnValue
  }
}
