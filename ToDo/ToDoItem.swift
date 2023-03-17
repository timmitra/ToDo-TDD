//
//  ToDoItem.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-10.
//

import Foundation

struct ToDoItem: Equatable {
  let title: String
  let itemDescription: String?
  let timestamp: TimeInterval?
  let location: Location?
  
  init(title: String,
       itemDescription: String? = nil,
       timestamp: TimeInterval? = nil,
       location: Location? = nil) {
    self.title = title
    self.itemDescription = itemDescription
    self.timestamp = timestamp
    self.location = location
  }
}
