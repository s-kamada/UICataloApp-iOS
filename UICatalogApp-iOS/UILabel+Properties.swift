//
//  UILabel+Properties.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2020/11/04.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

class UILabelPropertiesDataSource {
    static let properties: [Property] = [
        .init(title: "text", description: "", type: .string),
        .init(title: "isEnabled", description: "", type: .bool)
    ]
}
