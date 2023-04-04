//
//  ToDoItemInputView.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-25.
//

import SwiftUI

struct ToDoItemInputView: View {
  
  @ObservedObject var data: ToDoItemData
  var didAppear: ((Self) -> Void)?
  
    var body: some View {
      Form {
        SwiftUI.Section {
          TextField("Title", text: $data.title)
          Toggle("Add Date", isOn: $data.withDate)
          if data.withDate {
            DatePicker("Date", selection: $data.date)
          }
        }
        SwiftUI.Section {
          TextField("Location name", text: $data.locationName)
        }
        SwiftUI.Section {
          Button(action: addToDoItem,
                 label: {
            Text("Save")
          })
        }
      }
    }
  
  func addToDoItem() {
    
  }
}

struct ToDoItemInputView_Previews: PreviewProvider {
    static var previews: some View {
      ToDoItemInputView(data: ToDoItemData())
    }
}
