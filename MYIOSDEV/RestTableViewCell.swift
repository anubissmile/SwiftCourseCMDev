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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
