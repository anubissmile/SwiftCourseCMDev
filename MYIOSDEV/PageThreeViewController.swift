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
    var mRefreshControl: UIRefreshControl!
    var mBlurView: DKLiveBlurView!
    
    var mDataArray: [Youtube] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.feedData()
        
        // Add refresh control
        self.mRefreshControl = UIRefreshControl()
        self.mRefreshControl.addTarget(self, action: #selector(feedDatas), for: .valueChanged)
        self.mTableView.addSubview(self.mRefreshControl)
        
        // Add header view (optional)
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: 1, height: 250)
        self.mTableView.tableHeaderView = headerView
        
        // Setup Blur Effect
        self.mBlurView = DKLiveBlurView()
        self.mBlurView.originalImage = UIImage(named: "listview_iphone.png")
        self.mTableView.backgroundView = self.mBlurView
        
        // scrim
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
            UIColor.white.withAlphaComponent(0.7).cgColor, UIColor.white.withAlphaComponent(0.8).cgColor]
        self.mBlurView.layer.insertSublayer(gradient, at: 0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.mBlurView.scrollView = self.mTableView
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.mBlurView.scrollView = nil
    }
    
    @objc func feedDatas(){
        
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
            self.mRefreshControl.endRefreshing()
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

