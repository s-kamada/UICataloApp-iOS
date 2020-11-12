//
//  UILabel+Properties.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2020/11/04.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit

final class UILabelPropertiesDataSource {
    static let properties: [Property] = [
        .init(title: "text", description: "", type: .string, option: nil),
        .init(title: "isEnabled", description: "", type: .bool, option: nil),
        .init(title: "alignment", description: "a", type: .choice, option: PropertyOptions.textalignment)
    ]
}

final class PropertyOptions: Chooseable {

    // Collectionにした方が良さそう(順序を保持するCollection、KeyValuePairs)
    // https://dev.classmethod.jp/articles/about-swiftkeyvaluepairs/
    static let textalignment: [String: NSTextAlignment] = [
        "left": .left,
        "right": . right,
        "center": .center,
        "justified": .justified,
        "natural": .natural
    ]
}

