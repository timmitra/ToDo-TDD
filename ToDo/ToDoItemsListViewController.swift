//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-21.
//

import UIKit
import Combine

class ToDoItemsListViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  var toDoItemStore: ToDoItemStoreProtocol?
  private var items: [ToDoItem] = []
  private var token: AnyCancellable?

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    token = toDoItemStore?.itemPublisher
      .sink(receiveValue: { [weak self] items in
        self?.items = items
      })
  }
}

extension ToDoItemsListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}

