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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func didChangeStatus(_ sender: UISwitch) {
        // buttonのon/offに合わせてそのプロパティを変える
        // getProperty(プロパティのキー名) = isOnとかしたい
        // プロパティの名前、テキストなどを一覧したenumを作る
        // TODO: 自作Delegateとして実装した方が良さそうか https://qiita.com/s_emoto/items/04505ed549178555b10b
        
    }
}
