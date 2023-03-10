//
//  Location.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-10.
//

import Foundation
import CoreLocation

struct Location {
  let name: String
  let coordinate: CLLocationCoordinate2D?
  
  init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
    self.name = name
    self.coordinate = coordinate
  }
}
