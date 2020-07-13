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
    var tableView: UITableView?

	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.title = "UILabel"
        
        previewLabel.isAccessibilityElement = false
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // TODO: なぜかcellのクラスを拾ってくれない
            // Use of undeclared type 'PropertiesTableViewCell'
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReusableIdentifier, for: indexPath) as! PropertiesTableViewCell

            return UITableViewCell.init()
        }
}

struct Constants {
    static let cellReusableIdentifier = "propertiesCell"
}
