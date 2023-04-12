//
//  NavigationControllerMock.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-04-11.
//

import UIKit

class NavigationControllerMock: UINavigationController {
  
  var lastPushedViewController: UIViewController?
  
  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    lastPushedViewController = viewController
    super.pushViewController(viewController, animated: animated)
  }
}
