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
	
	let cellReusableIdentifier = "tableViewCell"
	
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
    //        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReusableIdentifier, for: indexPath) as? TableViewCell else { return
    //
    //        }
            return UITableViewCell.init()
        }
}
