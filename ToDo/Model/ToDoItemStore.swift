//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-10.
//

import Foundation
import Combine

class ToDoItemStore: ToDoItemStoreProtocol {
  /* <[ToDoItem], Never> means that the publisher sends arrays of ToDoItems. The second part, Never, is the failure type of this publisher. Never means that this publisher cannot fail. */
  var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
  private let fileName: String
  
  init(fileName: String = "todoItems") {
    self.fileName = fileName
    loadItems()
  }
  
  private var items: [ToDoItem] = [] {
    didSet {
      itemPublisher.send(items)
    }
  }
  
  func add(_ item: ToDoItem) {
    items.append(item)
    saveItems()
  }
  
  func check(_ item: ToDoItem) {
    var mutableItem = item
    mutableItem.done = true
    if let index = items.firstIndex(of: item) {
      items[index] = mutableItem
      saveItems()
    }
  }
  
  private func saveItems() {
    let url = FileManager.default
      .documentsURL(name: fileName)
      do {
        let data = try JSONEncoder().encode(items)
        try data.write(to: url)
      } catch {
        print("error: \(error)")
      }
  }
  
  private func loadItems() {
    let url = FileManager.default
      .documentsURL(name: fileName)
    do {
      let data = try Data(contentsOf: url)
      items = try JSONDecoder()
        .decode([ToDoItem].self, from: data)
    } catch {
      print("error: \(error)")
    }
  }
}

protocol ToDoItemStoreProtocol {
  var itemPublisher: CurrentValueSubject<[ToDoItem], Never>
  { get set }
  func check(_: ToDoItem)
}
