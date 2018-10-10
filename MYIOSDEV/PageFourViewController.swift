//
//  PageFourViewController.swift
//  MYIOSDEV
//
//  Created by macbookair on 8/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit
import FMDB // SQLite Library Manager

class PageFourViewController: UIViewController {
    
    @IBOutlet weak var mTableView: UITableView!
    
    var mDatabase: FMDatabase!
    
    var mDataArray: [[String : String]] = [] //This is Dictionary variable [key : val]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SQLite
        self.openDB()
        self.query()
    }
    
    func query(){
        self.mDataArray.removeAll()
        
        let command = "SELECT ROW, FIELD_DATA FROM FIELDS ORDER BY ROW DESC"
        
        if let rs = self.mDatabase.executeQuery(command, withArgumentsIn: []){
            
            while rs.next() {
                let data_rowID = rs.int(forColumn: "ROW")
                let data_field_data = rs.string(forColumn: "FIELD_DATA")
                
                let item: [String:String] = [
                    "ROW": String(data_rowID),
                    "FIELD_DATA": data_field_data!
                ]
                
                self.mDataArray.append(item)
            }
            
            // Reload data when feed finish.
            self.mTableView.reloadData()
        } else {
            print("select failed: \(self.mDatabase.lastErrorMessage())")
        }
    }
    
    func openDB(){
        let databaseName = "data.sqlite"
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let path = documentsFolder + "/\(databaseName)"
        print("\n\ndb path: \(path)\n\n")
        
        let fileManager = FileManager()
        
        if (!fileManager.fileExists(atPath: path)){
            let dbFilePath = Bundle.main.path(forResource: databaseName, ofType: nil)!
            
            do {
                try fileManager.copyItem(atPath: dbFilePath, toPath: path)
            }catch{
                print(error)
            }
        }
        
        self.mDatabase = FMDatabase(path: path)
        self.mDatabase.open()
    }
    
    @IBAction func addClick(){
        
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


// Delegate Zone.

extension PageFourViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! SQLiteTableViewCell // This is casting data type.
        
        
        let item = self.mDataArray[indexPath.row]
        
        cell.mFlightLabel.text = item["FIELD_DATA"]
        cell.mFlightImage.image = UIImage(named: "landing_icon.png")
        
        if (indexPath.row % 2 == 0){
            cell.mFlightLabel.textColor = #colorLiteral(red: 0, green: 0.5882352941, blue: 0.9529411765, alpha: 1)
//            cell.mFlightLabel.background
        }else{
            cell.mFlightLabel.textColor = #colorLiteral(red: 0, green: 0.6274509804, blue: 0, alpha: 1)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "section") // This is casting data type.
        return cell!
    }
    
}
