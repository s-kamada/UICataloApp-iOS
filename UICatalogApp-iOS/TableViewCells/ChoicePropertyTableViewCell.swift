//
//  ChoicePropertyTableViewCell.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2020/11/06.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit

class ChoicePropertyTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var choiceField: UITextField!

    var datasource: Property?

    private let picker = UIPickerView()
    private let toolBar = UIToolbar()
    private lazy var doneButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "完了"
        button.style = .plain
        button.action = #selector(doneButtonPressed)
        button.target = self
        return button
    }()

    private var choices: KeyValuePairs<String, Any>?

    weak var delegate: ChoicePropertyChangedDelegate?

    func setup(datasource: Property) {
        self.datasource = datasource
        titleLabel.text = datasource.title
        detailLabel.text = datasource.description
        choices = datasource.option
        choiceField.placeholder = datasource.title

        picker.dataSource = self
        picker.delegate = self
        toolBar.sizeToFit()
        toolBar.setItems([doneButton], animated: true)

        choiceField.inputView = picker
        choiceField.inputAccessoryView = toolBar
    }

    @objc func doneButtonPressed() {
        delegate?.doneButtonPressed()
    }
}

extension ChoicePropertyTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices?.count ?? 0
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        guard let datasource = datasource else { return }

        choiceField.text = choices?[row].0 ?? ""
        delegate?.choiceValueDidChange(key: datasource.title, value: choices?[row].1 ?? "")
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices?[row].0 ?? ""
    }
}

protocol ChoicePropertyChangedDelegate: AnyObject {
    func choiceValueDidChange(key: String, value: Any)
    func doneButtonPressed()
}
