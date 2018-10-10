//
//  RestTableViewCell.swift
//  MYIOSDEV
//
//  Created by macbookair on 9/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit

class RestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mAvatarImage: UIImageView!
    @IBOutlet weak var mYoutubeImage: UIImageView!
    @IBOutlet weak var mTitleLabel: UILabel!
    @IBOutlet weak var mSubtitleLabel: UILabel!
    @IBOutlet weak var mCardView: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.mAvatarImage.drawAsCircle(radius: 6)
        self.mYoutubeImage.drawAsCircle(radius: 5)
        self.mCardView.drawAsCircle(radius: 5)
        self.mCardView.dropShadow()
        self.mCardView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)
        
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
