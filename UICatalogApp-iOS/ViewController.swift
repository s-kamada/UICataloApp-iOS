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
        #if DEBUG
//        let values = previewLabel.dictionaryWithValues(forKeys: ["textAlignment"])
//        print(values)

        var count: UInt32 = 0
        let properties = class_copyPropertyList(UILabel.self, &count)
        for i in 0..<Int(count) {
            let prop = (properties?[i])!
            let propName = NSString(utf8String: property_getName(prop))
            print(propName!)
            previewLabel.value(forKey: propName! as String)
        }
        #endif

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

        case .button:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.simpleButtonCellReuseIdentifier, for: indexPath) as? SimpleButtonTableViewCell else { return UITableViewCell() }

            cell.setup(title: property.title)
            return cell

        default: return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let property = UILabelPropertiesDataSource.properties[indexPath.row]

        switch property.type {
        case .button:
            print("button pushed")
            break

        default: break
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
        previewLabel.setValuesForKeys([key: value])
    }
}

extension ViewController: ChoicePropertyChangedDelegate {
    func doneButtonPressed() {
        view.endEditing(true)
    }

    func choiceValueDidChange(key: String, value: Any) {
        previewLabel.setValuesForKeys([key: value])
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
    static let simpleButtonCellReuseIdentifier = "SimpleButtonTableViewCell"

    // TODO: もう少し違うところに置く
    static let dummySentents = "あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。"

    static let dummyLongSentents = "山路を登りながら、こう考えた。智に働けば角が立つ。情に棹させば流される。意地を通せば窮屈だ。とかくに人の世は住みにくい。住みにくさが高じると、安い所へ引き越したくなる。どこへ越しても住みにくいと悟った時、詩が生れて、画が出来る。"

    static let dummyEnglishSentents = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
}
