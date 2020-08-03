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

    func setup() {
        detailLabel.text = "DETAIL"
        titleLabel.text = "TITLE"
        statusLabel.text = "STATUS"
        statusLabel.lineBreakMode = .byClipping

        backgroundColor = .red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func didChangeStatus(_ sender: UISwitch) {
        // buttonのon/offに合わせてそのプロパティを変える
        // getProperty(プロパティのキー名) = isOnとかしたい
        // プロパティの名前、テキストなどを一覧したenumを作る

        
    }
}
