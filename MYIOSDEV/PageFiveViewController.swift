//
//  PageFiveViewController.swift
//  MYIOSDEV
//
//  Created by macbookair on 8/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit

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
    }
}
