//
//  AppCoordinator.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-04-11.
//

import UIKit

protocol Coordinator {
  func start()
}

class AppCoordinator: Coordinator {
  private let window: UIWindow?
  private let viewController: UIViewController
  private let navigationController: UINavigationController
  let toDoItemStore: ToDoItemStore
  
  init(window: UIWindow?, navigationController: UINavigationController = UINavigationController()) {
    self.window = window
    self.navigationController = navigationController
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    viewController =
    storyboard.instantiateViewController(
      withIdentifier: "ToDoItemsListViewController")
    toDoItemStore = ToDoItemStore()
  }
   
  func start() {
    navigationController.pushViewController(viewController, animated: false)
    window?.rootViewController = navigationController
    if let listViewController = viewController as? ToDoItemsListViewController {
      listViewController.delegate = self
      listViewController.toDoItemStore = toDoItemStore
    }
  }
}

extension AppCoordinator: ToDoItemsListViewControllerProtocol {
 
  func selectToDoItem(_ viewController: UIViewController, item: ToDoItem) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let next = storyboard.instantiateViewController(withIdentifier: "ToDoItemDetailsViewController") as? ToDoItemDetailsViewController else {
      return
    }
    next.loadViewIfNeeded()
    next.toDoItem = item
    navigationController.pushViewController(next, animated: true)
  }
  
}
