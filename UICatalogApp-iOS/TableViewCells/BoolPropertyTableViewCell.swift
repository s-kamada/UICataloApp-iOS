//
//  TableViewCell.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2019/09/23.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class BoolPropertyTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var optionSwitch: UISwitch!

    weak var delegate: BoolPropertyChangedDelegate?

    func setup(dataSource: Property) {
        detailLabel.text = dataSource.description
        titleLabel.text = dataSource.title
        statusLabel.text = String(optionSwitch.isOn)
        statusLabel.lineBreakMode = .byClipping
    }

    @IBAction func didChangeStatus(_ sender: UISwitch) {
        // buttonのon/offに合わせてそのプロパティを変える
        // getProperty(プロパティのキー名) = isOnとかしたい
        // TODO: 自作Delegateとして実装した方が良さそうか https://qiita.com/s_emoto/items/04505ed549178555b10b
        print("Bool didChangedStatus \(sender.isOn)")
        self.delegate?.boolValueDidChange(sender.isOn)
        statusLabel.text = String(sender.isOn)
    }
}

protocol BoolPropertyChangedDelegate: AnyObject {
    func boolValueDidChange(_ value: Bool)
}
