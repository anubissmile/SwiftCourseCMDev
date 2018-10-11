//
//  ShowInfoViewController.swift
//  MyMap
//
//  Created by macbookair on 11/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class ShowInfoViewController: UIViewController {
    
    var marker: GMSMarker!
    @IBOutlet weak var mView: GMSMapView!
    @IBOutlet weak var mAddress: UILabel!
    @IBOutlet weak var mTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mView.layer.cornerRadius = 120
        
        renderDetail(details: marker)
        setupMap()
        renderMap(place: marker)
    }
    
    func setupMap() {
        self.mView.mapType = .terrain
        self.mView.settings.compassButton = false
        self.mView.settings.myLocationButton = false
        self.mView.isMyLocationEnabled = true
        self.mView.isTrafficEnabled = true
        self.mView.delegate = self
    }
    
    func renderDetail(details: GMSMarker!) {
        //Render details
        self.mTitle.text = details.title
        self.mAddress.text = details.snippet
    }
    
    func renderMap(place: GMSMarker!) {
        //Render map
        //Set up marker
        
        let marker = GMSMarker()
        marker.position = place.position
        marker.title = place.title
        marker.snippet = place.snippet
        marker.appearAnimation = .pop
        marker.icon = place.icon
        
        marker.map = self.mView //add marker
        
        self.mView.selectedMarker = marker  //Show Info window
        self.mView.animate(toLocation: marker.position) //Move Camera
        self.dismiss(animated: true)
        
        var bound = GMSCoordinateBounds()
        bound = bound.includingCoordinate(place.position)
        self.mView.animate(with: GMSCameraUpdate.fit(bound, withPadding: 5))
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ShowInfoViewController:GMSMapViewDelegate, CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.first{
            let camera = GMSCameraPosition.camera(withTarget: currentLocation.coordinate, zoom: 5)
            self.mView.camera = camera
        }
    }
}
