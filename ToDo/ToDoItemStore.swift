//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-10.
//

import Foundation
import Combine

class ToDoItemStore {
  /* <[ToDoItem], Never> means that the publisher sends arrays of ToDoItems. The second part, Never, is the failure type of this publisher. Never means that this publisher cannot fail. */
  var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
  private var items: [ToDoItem] = [] {
    didSet {
      itemPublisher.send(items)
    }
  }
  
  func add(_ item: ToDoItem) {
    items.append(item)
  }
  
  func check(_ item: ToDoItem) {
    var mutableItem = item
    mutableItem.done = true
    if let index = items.firstIndex(of: item) {
      items[index] = mutableItem
    }
  }
}
