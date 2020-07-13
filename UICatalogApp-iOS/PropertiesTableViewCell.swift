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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
