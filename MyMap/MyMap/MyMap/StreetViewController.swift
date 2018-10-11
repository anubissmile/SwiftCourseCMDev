//
//  StreetViewController.swift
//  MyMap
//
//  Created by macbookair on 11/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class StreetViewController: UIViewController {
    
    var coordinate: CLLocationCoordinate2D!
    @IBOutlet weak var mStreetView: GMSPanoramaView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mStreetView.moveNearCoordinate(self.coordinate)
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
