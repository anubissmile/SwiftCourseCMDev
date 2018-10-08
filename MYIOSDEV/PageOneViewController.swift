//
//  PageOneViewController.swift
//  MYIOSDEV
//
//  Created by macbookair on 8/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit
import WebKit

class PageOneViewController: UIViewController {
    
    @IBOutlet weak var mWebKit: WKWebView!
    @IBOutlet weak var mLoading: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSegmentChange(sender: UISegmentedControl){
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("select index 0")
        default:
            print("select index 1")
        }
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
