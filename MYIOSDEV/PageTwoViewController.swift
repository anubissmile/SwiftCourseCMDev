//
//  PageTwoViewController.swift
//  MYIOSDEV
//
//  Created by macbookair on 8/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit
import QRCode
class PageTwoViewController: UIViewController {
    
    @IBOutlet weak var mTextField: UITextField!
    @IBOutlet weak var mQRCodeImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func onMyGenerate(){  // You can change your own method name and must to re-binding this method to UI object.
        let text = self.mTextField.text
        
        if text != nil && text != "" {
            var qrCode = QRCode(text!)
            qrCode!.color = CIColor(rgba: "f07b35")
            qrCode!.backgroundColor = CIColor(rgba: "fff")
            self.mQRCodeImageView.image = qrCode?.image
        }else{
            self.mQRCodeImageView.image = UIImage(named: "qr_code_generator.png")
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
