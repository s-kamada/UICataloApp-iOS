//
//  ChoicePropertyTableViewCell.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2020/11/06.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit

class ChoicePropertyTableViewCell: UITableViewCell, UITextViewDelegate, UITextFieldDelegate, UIPickerViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var choiceField: UITextField!

    private let picker = UIPickerView()
    private let toolBar = UIToolbar()
    private let doneButton = UIBarButtonItem(title: "完了", style: .plain, target: nil, action: nil)

    private var choices: [String: Any]?
    let dummyValue = [1 ... 100]

    weak var delegate: ChoicePropertyChangedDelegate?

    func setup(datasource: Property) {
        titleLabel.text = datasource.title
        detailLabel.text = datasource.description

        choices = datasource.option

        picker.dataSource = self
        picker.delegate = self
        picker.tag = 1
        choiceField.delegate = self
//        choiceField.inputView = picker

//        choiceField.inputAccessoryView = toolBar
//        toolBar.sizeToFit()
//        toolBar.setItems([doneButton], animated: true)
//        picker.reloadAllComponents()

        choiceField.placeholder = "placeholder"
    }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }

    // TODO: move to extension
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3//choices?.count ?? 0
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        choiceField.text = choices[row] as! String
//        guard let choices = choices else { return }
//        let key = choices.keys
//        delegate?.choiceValueDidChange(choices[key])

        choiceField.text = "a"
//        delegate?.choiceValueDidChange(dummyValue[row])
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        guard let key = choices?.keys else { return "" }
        return "a"
    }
}

extension ChoicePropertyTableViewCell: UIPickerViewDelegate {

}

protocol ChoicePropertyChangedDelegate: AnyObject {
    func choiceValueDidChange(_ value: Any)
}
