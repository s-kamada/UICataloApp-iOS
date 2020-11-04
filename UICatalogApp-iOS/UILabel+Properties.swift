//
//  UILabel+Properties.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2020/11/04.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

class UILabelPropertiesDataSource {
    var parameter: [Parameter] = [
        .init(title: "text", description: "ラベルのテキスト", type: .string),
        .init(title: "line break", description: "改行の有無", type: .bool)
    ]
}
