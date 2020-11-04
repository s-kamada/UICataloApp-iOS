//
//  ViewController.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2019/09/23.
//  Copyright © 2019 personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var previewLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
        
        previewLabel.isAccessibilityElement = false
        tableView.delegate = self
        tableView.dataSource = self
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.boolPropertyCellReusableIdentifier, for: indexPath) as! BoolPropertyTableViewCell
        
        cell.setup()
        cell.delegate = self

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ViewController: PropertyChangedDelegate {
    func valueDidChange(_ value: Bool) {
        previewLabel.text = String(value)
    }
}

struct Constants {
    static let boolPropertyCellReusableIdentifier = "boolPropertyCell"
}
