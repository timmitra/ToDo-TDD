//
//  ToDoItemData.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-25.
//

import Foundation

class ToDoItemData: ObservableObject {
  @Published var title = ""
  @Published var date = Date()
  @Published var withDate = false
  @Published var itemDescription = ""
}
