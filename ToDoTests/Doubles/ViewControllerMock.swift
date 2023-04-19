//
//  ViewControllerMock.swift
//  ToDoTests
//
//  Created by Tim Mitra on 2023-04-19.
//

import UIKit

class ViewControllerMock: UIViewController {
  
  var lastPresented: UIViewController?
  
  override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
    lastPresented = viewControllerToPresent
    super.present(viewControllerToPresent, animated: flag, completion: completion)
  }
}
