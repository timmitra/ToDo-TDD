//
//  ToDoItem.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-10.
//

import Foundation

struct ToDoItem {
  let title: String
  let itemDescription: String?
  let timestamp: TimeInterval?
  
  init(title: String,
       itemDescription: String? = nil,
       timestamp: TimeInterval? = nil) {
    self.title = title
    self.itemDescription = itemDescription
    self.timestamp = timestamp
  }
}
