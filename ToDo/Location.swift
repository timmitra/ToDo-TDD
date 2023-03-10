//
//  Location.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-10.
//

import Foundation
import CoreLocation

struct Location: Equatable {
  let name: String
  let coordinate: CLLocationCoordinate2D?
  
  init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
    self.name = name
    self.coordinate = coordinate
  }
  
  static func == (lhs: Location, rhs: Location) -> Bool {
    if lhs.name != rhs.name {
      return false
    }
    if lhs.coordinate == nil,  rhs.coordinate != nil {
      return false
    }
    if lhs.coordinate != nil, rhs.coordinate == nil {
      return false
    }
    if let lhsCoordinate = lhs.coordinate,
       let rhsCoordinate = rhs.coordinate {
      
      if abs(lhsCoordinate.latitude - rhsCoordinate.latitude) > 0.000_001 {
        return false
      }
      if abs(lhsCoordinate.longitude - rhsCoordinate.longitude) > 0.000_001 {
        return false
      }
    }
    return true
  }
}
