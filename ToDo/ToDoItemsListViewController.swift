//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-21.
//

import UIKit
import Combine

enum Section {
  case todo
  case done
}

class ToDoItemsListViewController: UIViewController, UITableViewDelegate {

  @IBOutlet var tableView: UITableView!
  var toDoItemStore: ToDoItemStoreProtocol?
  private var items: [ToDoItem] = []
  private var token: AnyCancellable?
  let dateFormatter = DateFormatter()
  private var dataSource:
    UITableViewDiffableDataSource<Section, ToDoItem>?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataSource =
    UITableViewDiffableDataSource<Section, ToDoItem>(
      tableView: tableView,
      cellProvider: { [weak self] tableView, indexPath, item   in
        let cell = tableView.dequeueReusableCell(
          withIdentifier: "ToDoItemCell",
          for: indexPath
        ) as! ToDoItemCell
        cell.titleLabel.text = item.title
        if let timestamp = item.timestamp {
          let date = Date(timeIntervalSince1970: timestamp)
          cell.dateLabel.text = self?.dateFormatter
            .string(from: date)
        }
        return cell
    })
    token = toDoItemStore?.itemPublisher
      .sink(receiveValue: { [weak self] items in
        self?.items = items
        self?.update(with: items)
      })
    tableView.register(
      ToDoItemCell.self,
      forCellReuseIdentifier: "ToDoItemCell"
    )
    tableView.delegate = self
  }
  
  private func update(with items: [ToDoItem]) {
    var snapshot =
    NSDiffableDataSourceSnapshot<Section, ToDoItem>()
    snapshot.appendSections([.todo, .done])
    snapshot.appendItems(items.filter({ $0.done }),
                         toSection: .done)
    dataSource?.apply(snapshot)
  }
}

