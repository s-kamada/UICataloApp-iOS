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

    // プロパティを更新されたらlabelを更新する
    private func updateUI() {
        // プロパティに共通する型とかないの？
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReusableIdentifier, for: indexPath) as! PropertiesTableViewCell
        
        cell.setup()

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

struct Constants {
    static let cellReusableIdentifier = "propertiesCell"
}
