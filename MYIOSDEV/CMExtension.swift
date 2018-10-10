//
//  CMExtension.swift
//  MYIOSDEV
//
//  Created by macbookair on 10/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import Foundation
import UIKit

extension String{
    func convertURL() -> URL{
        return URL(string: self)!
    }
}

extension UIView{
    func drawAsCircle(radius: CGFloat? = nil) {
        self.layer.masksToBounds = true
        
        if let cornerRadius = radius{
            self.layer.cornerRadius = cornerRadius
        }else{
            self.layer.cornerRadius = self.bounds.height / 2
        }
    }
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: -0.15, height: 0.15)
        self.layer.shadowRadius = 2
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
