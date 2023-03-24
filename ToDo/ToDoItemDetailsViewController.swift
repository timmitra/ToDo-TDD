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
}
