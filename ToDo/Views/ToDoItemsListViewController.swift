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

protocol ToDoItemsListViewControllerProtocol {
  func selectToDoItem(_ viewController: UIViewController, item: ToDoItem)
  func addToDoItem(_ viewController: UIViewController)
}

class ToDoItemsListViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  var toDoItemStore: ToDoItemStoreProtocol?
  private var items: [ToDoItem] = []
  private var token: AnyCancellable?
  let dateFormatter = DateFormatter()
  private var dataSource:
    UITableViewDiffableDataSource<Section, ToDoItem>?
  var delegate: ToDoItemsListViewControllerProtocol?

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
    
    let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add(_:)))
    navigationItem.rightBarButtonItem = addItem
  }
  
  private func update(with items: [ToDoItem]) {
    var snapshot =
    NSDiffableDataSourceSnapshot<Section, ToDoItem>()
    snapshot.appendSections([.todo, .done])
    snapshot.appendItems(items.filter({ $0.done }),
                         toSection: .done)
    dataSource?.apply(snapshot)
  }
  
  @objc func add(_ sender: UIBarButtonItem) {
    delegate?.addToDoItem(self)
  }
}

extension ToDoItemsListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = items[indexPath.row]
    delegate?.selectToDoItem(self, item: item)
  }
}

