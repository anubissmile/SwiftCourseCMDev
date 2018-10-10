//
//  PageThreeViewController.swift
//  MYIOSDEV
//
//  Created by macbookair on 8/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class PageThreeViewController: UIViewController {
    
    @IBOutlet weak var mTableView: UITableView!
    let BASE_URL: String = "http://codemobiles.com/"
    
    var mDataArray: [Youtube] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.feedData()
    }
    
    func feedData(){
        let url = "\(BASE_URL)adhoc/youtubes/"
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Youtubes.self, from: response.data!)
                    print(result.youtubes[0].title)
                    self.mDataArray = result.youtubes
                    
                    //Reload Table
                    self.mTableView.reloadData()
                }catch let err{
                    print(err)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
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

// Delegate Zone.

extension PageThreeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! RestTableViewCell // This is casting data type.
        let item = self.mDataArray[indexPath.row]
        cell.mTitleLabel.text = item.title
        cell.mSubtitleLabel.text = item.subtitle
        
        // Read Image
        
        cell.mAvatarImage.af_setImage(withURL: item.avatarImage.convertURL())
        cell.mYoutubeImage.af_setImage(withURL: item.youtubeImage.convertURL())
        return cell
    }
    
    
}

