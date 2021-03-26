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
    var titleLabel = UILabel()
    // TODO: 他のcellと同じまとめ方をする(storyboardが治ったら)
    override var reuseIdentifier: String? {
        return "SimpleButtonTableViewCell"
    }

    func setup(title: String) {
        titleLabel.text = title

        guard let superview = superview else { return }
        NSLayoutConstraint.activate(
            [
                titleLabel.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 10),
                titleLabel.heightAnchor.constraint(equalToConstant: 21),
                titleLabel.topAnchor.constraint(equalTo: superview.topAnchor, constant: 12)

            ]
        )
    }
}
