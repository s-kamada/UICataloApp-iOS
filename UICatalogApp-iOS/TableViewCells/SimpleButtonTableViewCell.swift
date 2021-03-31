//
//  SimpleButtonTableViewCell.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2021/03/25.
//  Copyright © 2021 personal. All rights reserved.
//

import Foundation
import UIKit

class SimpleButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    func setup(title: String) {
        titleLabel.text = title
    }
}
