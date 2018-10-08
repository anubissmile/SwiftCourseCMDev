//
//  ViewController.swift
//  MYIOSDEV
//
//  Created by macbookair on 8/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Set title name
        let selectedRow = self.tableView.indexPathForSelectedRow
        let cell = self.tableView.cellForRow(at: selectedRow!)
        segue.destination.title = cell?.textLabel?.text
        
        // Set name of back button
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationItem.backBarButtonItem = backButton
    }

}

