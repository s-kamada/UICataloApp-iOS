//
//  TableViewCell.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2019/09/23.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class PropertiesTableViewCell: UITableViewCell {
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var optionSwitch: UISwitch!

    override func awakeFromNib () {
        super.awakeFromNib ()
        // Initialization code
    }
    override func setSelected (_ selected: Bool, animated: Bool) {
        super.setSelected (selected, animated: animated)
        // Configure the view for the selected state
    }
}
