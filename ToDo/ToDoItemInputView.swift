//
//  ToDoItemInputView.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-25.
//

import SwiftUI

struct ToDoItemInputView: View {
  
  @ObservedObject var data: ToDoItemData
  @State var dummy: String = ""
  
    var body: some View {
      TextField("Title", text: $data.title)
    }
}

struct ToDoItemInputView_Previews: PreviewProvider {
    static var previews: some View {
      ToDoItemInputView(data: ToDoItemData())
    }
}
