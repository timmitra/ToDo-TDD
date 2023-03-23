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
  let dateFormatter = DateFormatter()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    token = toDoItemStore?.itemPublisher
      .sink(receiveValue: { [weak self] items in
        self?.items = items
      })
    tableView.register(
      ToDoItemCell.self,
      forCellReuseIdentifier: "ToDoItemCell"
    )
  }
  
  
}

extension ToDoItemsListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: "ToDoItemCell",
        for: indexPath
      ) as! ToDoItemCell
      let item = items[indexPath.row]
      cell.titleLabel.text = item.title
      if let timestamp = item.timestamp {
        let date = Date(timeIntervalSince1970: timestamp)
        cell.dateLabel.text = dateFormatter.string(from: date)
      }
      return cell
    }
  
  
}

