//
//  ViewController.swift
//  MyMap
//
//  Created by macbookair on 11/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import RandomColorSwift
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var trackingItem: UIBarButtonItem!
    
    var locationManager: CLLocationManager!
    
    var IsTracking = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tracking()
        self.setupMap()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? StreetViewController{
            dest.coordinate = sender as! CLLocationCoordinate2D
            
            
            // Set name of back button
            let backButton = UIBarButtonItem()
            backButton.title = "Back"
            self.navigationItem.backBarButtonItem = backButton
        }
    }
    
    @IBAction func switchMapType(sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = .normal
        case 1:
            self.mapView.mapType = .satellite
        case 2:
            self.mapView.mapType = .hybrid
        case 3:
            self.mapView.mapType = .terrain
        default:
            self.mapView.mapType = .none
        }
    }
    
    @IBAction func onClickSearch() {
        let filter = GMSAutocompleteFilter()
        filter.country = "TH"
        filter.type = .establishment
        
        let placeVC = GMSAutocompleteViewController()
        placeVC.autocompleteFilter = filter
        placeVC.delegate = self
        self.present(placeVC, animated: true)
    }
    
    @IBAction func startLocationTracking(){
        if (self.IsTracking == true){
            self.locationManager.stopUpdatingLocation()
            self.IsTracking = false
        }else{
            self.locationManager.startUpdatingLocation()
            self.IsTracking = true
        }
    }
    
    func setupMap() {
        self.mapView.settings.compassButton = true
        self.mapView.settings.myLocationButton = true
        self.mapView.isMyLocationEnabled = true
        self.mapView.isTrafficEnabled = true
        self.mapView.delegate = self
    }
    
    // Tracking location
    func tracking(){
        self.locationManager = CLLocationManager()
        self.locationManager.distanceFilter = 100.0 // meters
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //Set always request permission to access location
        self.locationManager.requestAlwaysAuthorization()
        
        //Start tracking
        self.locationManager.startUpdatingLocation()
        
        self.locationManager.delegate = self
    }
    
    func addMarker(_ name: String, _ address: String?, _ coordinate: CLLocationCoordinate2D) {
        //Set up marker
        let marker = GMSMarker()
        marker.title = name
        marker.snippet = address
        marker.position = coordinate
        marker.appearAnimation = .pop
        marker.icon = UIImage(named: "user_pin.png")
        marker.map = self.mapView //Add Merker
        
        self.mapView.selectedMarker = marker  //Show Info window
        self.mapView.animate(toLocation: coordinate) //Move Camera
        self.dismiss(animated: true)
    }
    
}

extension ViewController: GMSMapViewDelegate, CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.first{
            let camera = GMSCameraPosition.camera(withTarget: currentLocation.coordinate, zoom: 16)
            self.mapView.camera = camera
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        //Homework. click at info window and open new ViewController and navigate
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        //Homework. Long click at map and open street view.
        self.performSegue(withIdentifier: "StreetViewSegue", sender: coordinate)
    }
}

extension ViewController: GMSAutocompleteViewControllerDelegate{
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        let placeName = place.name
        let placeAddress = place.formattedAddress
        let placeCoordinate = place.coordinate
        
        addMarker(placeName, placeAddress, placeCoordinate)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        self.dismiss(animated: true)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        self.dismiss(animated: true)
    }
    
    
}
