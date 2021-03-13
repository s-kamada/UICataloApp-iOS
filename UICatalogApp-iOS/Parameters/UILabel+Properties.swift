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
        .init(title: "textAlignment", description: "中央/左/右寄せなど", type: .choice, option: PropertyOptions.textalignment),
        .init(title: "line", description: "行数", type: .number, option: PropertyOptions.textLines)
    ]
}

final class PropertyOptions: Chooseable {

    static let textalignment: KeyValuePairs<String, Any>? = [
        "left": NSTextAlignment.left,
        "right": NSTextAlignment.right,
        "center": NSTextAlignment.center,
        "justified": NSTextAlignment.justified,
        "natural": NSTextAlignment.natural
    ]

    static let textLines: KeyValuePairs<String, Any>? = [
        "default": 1,
        "minimumValue": 0,
        "maxValue": 100,
        "step": 1
    ]

    static let textAlpha: KeyValuePairs<String, Any>? = [
        "default": 1,
        "minimumValue": 0,
        "maxValue": 1,
        "step": 0.05
    ]
}

