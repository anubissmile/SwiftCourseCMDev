//
//  PageOneViewController.swift
//  MYIOSDEV
//
//  Created by macbookair on 8/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit
import WebKit

class PageOneViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var mWebKit: WKWebView!
    @IBOutlet weak var mLoading: UIActivityIndicatorView!
    
    let mURL = "http://www.codemobiles.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Important
        self.mWebKit.navigationDelegate = self
        self.openWeb()
    }
    
    @IBAction func onSegmentChange(sender: UISegmentedControl){
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("select index 0")
            self.openWeb()
        default:
            print("select index 1")
            self.openPDF()
        }
    }
    
    func openPDF(){
        let pdfPath = Bundle.main.path(forResource: "product", ofType: "pdf")
        //let pdfPath = Bundle.main.path(forResource: "product.pdf", ofType: nil)
        
        let pdfData = NSData(contentsOfFile: pdfPath!)
        
        self.mWebKit.load(pdfData! as Data, mimeType: "application/pdf", characterEncodingName: "utf-8", baseURL: NSURL() as URL)
    }
    
    func openWeb() {
        let url = URL(string: self.mURL)
        let request = URLRequest(url: url!)
        
        self.mWebKit.load(request)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.mLoading.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.mLoading.stopAnimating()
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
