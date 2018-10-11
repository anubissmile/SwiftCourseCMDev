//
//  PageFiveViewController.swift
//  MYIOSDEV
//
//  Created by macbookair on 8/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit
import Alamofire

class PageFiveViewController: UIViewController {
    
    @IBOutlet weak var mImagePreview: UIImageView!
    
    var mIsSelectImage = false
    
    var mImagePicker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mImagePicker.delegate = self
    }
    
    @IBAction func openCamera(sender: UIButton){
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertVC.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        alertVC.addAction(UIAlertAction(title: "camera", style: .default, handler: { (alert) in
            //Open camera
            self.mImagePicker.sourceType = .camera
            self.present(self.mImagePicker, animated: true)
        }))
        
        alertVC.addAction(UIAlertAction(title: "gallery", style: .default, handler: { (alert) in
            //Open gallery
            self.mImagePicker.sourceType = .photoLibrary
            self.present(self.mImagePicker, animated: true)
        }))
        
        //        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        //        alertVC.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        //        alertVC.addAction(UIAlertAction(title: "camera", style: .default, handler: { (alert) in
        //            self.mImagePicker.sourceType = .camera
        //            self.present(self.mImagePicker, animated: true)
        //        }))
        //        alertVC.addAction(UIAlertAction(title: "gallery", style: .default, handler: { (alert) in
        //            self.mImagePicker.sourceType = .photoLibrary
        //            self.present(self.mImagePicker, animated: true)
        //        }))
        //
        //        // ActionSheet Popover on iPad
        if let popoverController = alertVC.popoverPresentationController {
            
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
            popoverController.permittedArrowDirections = .left // arrow
        }
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func upload(){
        
        if (!mIsSelectImage) {
            return
        }
        
        let image = self.mImagePreview.image?.jpegData(compressionQuality: 1)
        let name = "\(arc4random()).jpeg"
        //let url = "http://192.168.0.136:1150/uploads"  // asp .net core
        
        //let url = "http://192.168.0.136:3000/uploads" // node js
        
        //let url = "http://192.168.0.136:8080/up.php"   // php
        
        //My node server.js
        let url = "http://192.168.0.100:3000/uploads"
        
        self.uploadFile(url: url, data: image!, fileName: name)
    }
    
    func uploadFile(url: String, data: Data, fileName: String) {
        
        
        let parameter = ["username":"admin", "password":"1234"]
        let imageParameter = "userfiles"

        Alamofire.upload(multipartFormData: { MultipartFormData in
            MultipartFormData.append(data, withName: imageParameter, fileName: fileName, mimeType: "image/jpg")
            for(key, value) in parameter{
                MultipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
        }, to: url, method: .post) { encodingResult in
            switch encodingResult{
            case .success(let upload, _, _):
                upload.responseString(completionHandler: { (response) in
                    switch response.result {
                    case .success(let value):
                        print("success")
//                        self.showAlert(responseMsg: value)
                    //self.showAlertWithCloseOutSideEnable(responseMsg: value)
                    case .failure(let error):
                        print("network error \(error.localizedDescription)")
                    }
                })
            case .failure(let error):
                print("network error \(error.localizedDescription)")
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

extension PageFiveViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //Preview Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.mImagePreview.image = selectedImage
        self.mImagePreview.drawAsCircle()
        
        self.mImagePicker.dismiss(animated: true, completion: nil)
        
        self.mIsSelectImage = true
    }
}
