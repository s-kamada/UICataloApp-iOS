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

    weak var delegate: StringPropertyChangedDelegate?

    func setup(dataSource: Property) {
        titleLabel.text = dataSource.title
        detailLabel.text = dataSource.description
        imputTextField.delegate = self

        detailLabel.lineBreakMode = .byClipping

        imputTextField.addTarget(self, action: #selector(valueDidChange(sender:)), for: .editingChanged)
    }

    @objc func valueDidChange(sender: UITextField) {
        print("string didChangedStatus \(sender.text ?? "")")
        self.delegate?.stringValueDidChange(sender.text ?? "")
    }
}

extension StringPropertyTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

protocol StringPropertyChangedDelegate: AnyObject {
    func stringValueDidChange(_ value: String)
}
