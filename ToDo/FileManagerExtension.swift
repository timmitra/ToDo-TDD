//
//  FileManagerExtension.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-18.
//

import Foundation

extension FileManager {
  func documentsURL(name: String) -> URL {
    guard let documentsURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
      fatalError()
    }
    return documentsURL.appendingPathComponent(name)
  }
}
