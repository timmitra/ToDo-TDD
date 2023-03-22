//
//  ToDoItemStoreProtocolMock.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-03-21.
//

import Foundation
import Combine

@testable import ToDo
class ToDoItemStoreProtocolMock: ToDoItemStoreProtocoal {
  var itemPublisher = CurrentValueSubject<[ToDoItem], Never([])
  var checkLastCallArgument: ToDoItem?
  func check(_ item: ToDoItem) {
    checkLastCallArgument = item
  }
}
