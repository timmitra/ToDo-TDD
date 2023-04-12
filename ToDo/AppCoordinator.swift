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
  init(window: UIWindow?) {
    self.window = window
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    viewController = storyboard.instantiateViewController(withIdentifier: "ToDoItemsListViewController")
  }
  func start() {
    window?.rootViewController = viewController
  }
}
