//
//  ViewController.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2019/09/23.
//  Copyright © 2019 personal. All rights reserved.
//

import UIKit

// TODO: numberセルをつくる
// - ナンバーのキーボード
// - 範囲や刻み(整数じゃないといけないとか0~1じゃないといけないとか)はあるっぽい
// -> 作り込むならvalidationがひつよう

// TODO: Property.titleの文字列からプロパティ名を拾いたい
// func valueDidChange(value: Any) {
//     previewLabel.getProperty(property.title) = value
// }
// みたいなことをしたい

class ViewController: UIViewController {

    @IBOutlet weak var previewLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        print(previewLabel.dictionaryWithValues(forKeys: ["text", "textColor", "textAlignment", "isEnabled"]))
//        previewLabel.setValuesForKeys(["text": "hogehoge"])
//

//        let values = previewLabel.dictionaryWithValues(forKeys: ["isEnabled"])
//        print(values)

        var count: UInt32 = 0
        let properties = class_copyPropertyList(UILabel.self, &count)
        for i in 0..<Int(count) {
            let prop = (properties?[i])!
            let propName = NSString(utf8String: property_getName(prop))
            print(propName!)
            previewLabel.value(forKey: propName! as String)
        }

        previewLabel.isAccessibilityElement = false
        // サイズや改行を見やすくするために枠線をつける
        previewLabel.layer.borderWidth = 1.0
        previewLabel.layer.borderColor = UIColor.gray.cgColor

        tableView.keyboardDismissMode = .onDrag
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UILabelPropertiesDataSource.properties.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let property = UILabelPropertiesDataSource.properties[indexPath.row]

        switch property.type {
        case .bool:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.boolPropertyCellReusableIdentifier, for: indexPath) as? BoolPropertyTableViewCell else { return UITableViewCell() }

            cell.setup(dataSource: property)
            cell.delegate = self

            return cell

        case .string:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.stringPropertyCellReusableIdentifier, for: indexPath) as? StringPropertyTableViewCell else { return UITableViewCell() }

            cell.setup(dataSource: property)
            cell.delegate = self

            return cell

        case .choice:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.choicePropertyCellReuseIdentifier, for: indexPath) as? ChoicePropertyTableViewCell else { return UITableViewCell() }

            cell.setup(datasource: property)
            cell.delegate = self

            return cell

        case .number:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.numberPropertyCellReuseIdentifier, for: indexPath) as? NumberPropertyTableViewCell else { return UITableViewCell() }

            cell.setup(dataSource: property)
            cell.delegate = self

            return cell

        default: return UITableViewCell()
        }
    }
}

extension ViewController: StringPropertyChangedDelegate {
    func stringValueDidChange(key: String, value: String) {
        previewLabel.setValuesForKeys([key: value])
    }
}

extension ViewController: BoolPropertyChangedDelegate {
    func boolValueDidChange(key: String, value: Bool) {
        // todo:  this class is not key value coding-compliant for the key isEnabled.'になる

        if (responds(to: NSSelectorFromString(key))) {
            print("not respond to \(key)")
            return
        }
        let boolValue = value ? 1 : 0
//        previewLabel.setValue(boolValue, forKey: key)
//        previewLabel.setValuesForKeys([key: boolValue])
        previewLabel.set
    }
}

extension ViewController: ChoicePropertyChangedDelegate {
    func doneButtonPressed() {
        view.endEditing(true)
    }

    func choiceValueDidChange(key: String, value: Any) {
        print("choice didChangedStatus ")
        // TODO: Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__SwiftValue longLongValue]: unrecognized selector sent to instance 0x2820d6580'になる
//        previewLabel.setValuesForKeys([key: value] as [String: Any])
        previewLabel.setValue(value, forUndefinedKey: key)
    }
}

extension ViewController: NumberPropertyChangedDelegate {
    func numberPropertyDidChange(_ value: Double) {
        previewLabel.text = String(value)
    }
}

struct Constants {
    static let boolPropertyCellReusableIdentifier = "boolPropertyCell"
    static let stringPropertyCellReusableIdentifier = "stringPropertyCell"
    static let choicePropertyCellReuseIdentifier = "choicePropertyCell"
    static let numberPropertyCellReuseIdentifier = "numberPropertyCell"
}
