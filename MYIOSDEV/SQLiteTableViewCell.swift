//
//  SQLiteTableViewCell.swift
//  MYIOSDEV
//
//  Created by macbookair on 10/10/2561 BE.
//  Copyright © 2561 smartict. All rights reserved.
//

import UIKit

class SQLiteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mFlightLabel: UILabel!
    @IBOutlet weak var mFlightImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
