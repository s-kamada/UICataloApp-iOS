//
//  NumberPropertyTableViewCell.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2020/11/14.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit

class NumberPropertyTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var numberLabel: UITextField!
    @IBOutlet weak var stepper: UIStepper!

    weak var delegate: NumberPropertyChangedDelegate?

    func setup(dataSource: Property) {

        titleLabel.text = dataSource.title
        detailLabel.text = dataSource.description

        stepper.value = 1
        stepper.stepValue = 1.0
        stepper.minimumValue = 1
        stepper.maximumValue = 100
    }

    @IBAction func valueChanged(_ sender: UIStepper) {
        numberLabel.text = String(sender.value)

    }
}

protocol NumberPropertyChangedDelegate: AnyObject {
    func numberPropertyDidChange(_ value: Double)
}
