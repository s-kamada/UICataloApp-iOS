//
//  StringPropertyTableViewCell.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2020/11/04.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit

class StringPropertyTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imputTextField: UITextField!


    func setup() {
        detailLabel.lineBreakMode = .byClipping
    }
}
