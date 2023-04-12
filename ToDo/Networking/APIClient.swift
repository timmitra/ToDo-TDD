//
//  APIClient.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-04-03.
//

import Foundation
import CoreLocation

protocol APIClientProtocol {
  func coordinate(
    for: String,
    completion: @escaping (Coordinate?) -> Void
  )
}

class APIClient: APIClientProtocol {
  
  lazy var geocoder: GeoCoderProtocol = CLGeocoder()
  
  func coordinate(
    for address: String,
    completion: @escaping (Coordinate?) -> Void) {
      geocoder.geocodeAddressString(address) {
        placemarks, error in
        guard let clCoordinate = placemarks?.first?.location?.coordinate
        else {
          completion(nil)
          return
        }
        let coordinate = Coordinate(latitude: clCoordinate.latitude, longitude: clCoordinate.longitude)
        completion(coordinate)
      }
  }
}

protocol GeoCoderProtocol {
  func geocodeAddressString(
  _ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler)
}

extension CLGeocoder: GeoCoderProtocol { }
