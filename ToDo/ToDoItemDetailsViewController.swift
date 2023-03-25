//
//  ToDoItemDetailsViewController.swift
//  ToDo
//
//  Created by Tim Mitra on 2023-03-24.
//

import UIKit
import MapKit

class ToDoItemDetailsViewController: UIViewController {
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var dateLabel: UILabel!
  @IBOutlet var locationLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var mapView: MKMapView!
  @IBOutlet var doneButton: UIButton!
  let dateFormatter = DateFormatter()
  var toDoItem: ToDoItem? {
    didSet {
      titleLabel.text = toDoItem?.title
      if let timestamp = toDoItem?.timestamp {
        dateLabel.text = dateFormatter.string(from: Date(timeIntervalSince1970: timestamp))
      }
      locationLabel.text = toDoItem?.location?.name
      descriptionLabel.text = toDoItem?.itemDescription
      if let coordinate = toDoItem?.location?.coordinate {
        mapView.setCenter(CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), animated: false)
      }
      doneButton.isEnabled = (toDoItem?.done == false)
    }
  }
}
