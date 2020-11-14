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
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var stepper: UIStepper!

    weak var delegate: NumberPropertyChangedDelegate?

    func setup(dataSource: Property) {

        titleLabel.text = dataSource.title
        detailLabel.text = dataSource.description

        stepper.value = 1
        stepper.stepValue = 1.0
        stepper.minimumValue = 1
        stepper.maximumValue = 100

        numberField.addTarget(self, action: #selector(valueDidChangeFromTextField(sender:)), for: .editingChanged)
    }

    @IBAction func valueChanged(_ sender: UIStepper) {
        numberField.text = String(sender.value)
        delegate?.numberPropertyDidChange(sender.value)
    }

    @objc func valueDidChangeFromTextField(sender: UITextField) {
        // TODO: maxとminから外れた値の場合入力をブロックしたい
        let text = sender.text ?? ""
        self.delegate?.numberPropertyDidChange(Double(text) ?? 0.0)
        stepper.value = Double(text) ?? 0.0
    }
}

protocol NumberPropertyChangedDelegate: AnyObject {
    func numberPropertyDidChange(_ value: Double)
}
