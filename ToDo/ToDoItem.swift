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
  
  init(title: String, itemDescription: String? = nil) {
    self.title = title
    self.itemDescription = itemDescription
  }
}
