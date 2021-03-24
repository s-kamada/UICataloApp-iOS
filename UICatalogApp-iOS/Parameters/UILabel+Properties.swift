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
        .init(
            title: "text",
            description: "",
            type: .string,
            option: nil
        ),

        .init(
            title: "textColor",
            description: "",
            type: .choice,
            option: PropertyOptions.colors
        ),

        .init(
            title: "enabled",
            description: "",
            type: .bool,
            option: nil
        ),

        .init(
            title: "highlighted",
            description: "",
            type: .bool,
            option: nil
        ),

        .init(
            title: "highlightedTextColor",
            description: "",
            type: .choice,
            option: PropertyOptions.colors
        ),

        .init(
            title: "shadowColor",
            description: "",
            type: .choice,
            option: PropertyOptions.colors
        ),

        .init(
            title: "shadowOffset",
            description: "",
            type: .number,
            option: nil
        ),

        .init(
            title: "textAlignment",
            description: "中央/左/右寄せなど",
            type: .choice,
            option: PropertyOptions.textalignment
        ),

        .init(
            title: "line",
            description: "行数",
            type: .number,
            option: PropertyOptions.textLines
        )
    ]
}

final class PropertyOptions: Chooseable {

    // MARK: choice values
    /// setValuesForkeysで設定するが、rawValueでないと値が適用されない
    static let textalignment: KeyValuePairs<String, Any>? = [
        "left": NSTextAlignment.left.rawValue,
        "right": NSTextAlignment.right.rawValue,
        "center": NSTextAlignment.center.rawValue,
        "justified": NSTextAlignment.justified.rawValue,
        "natural": NSTextAlignment.natural.rawValue
    ]

    static let colors: KeyValuePairs<String, Any>? = [
        "systemblue": UIColor.systemBlue,
        "systemred": UIColor.systemRed,
        "systempink": UIColor.systemPink,
        "systemteal": UIColor.systemTeal,
        "systemgray": UIColor.systemGray,
        "systemgreen": UIColor.systemGreen,
        "systemorange": UIColor.systemOrange,
        "systemyellow": UIColor.systemYellow,
        "systempurple": UIColor.systemPurple,
        "black": UIColor.black,
        "blue": UIColor.blue,
        "red": UIColor.red,
        "green": UIColor.green,
        "gray": UIColor.gray,
        "white": UIColor.white,
        "purple": UIColor.purple,
        "brown": UIColor.brown,
        "cyan": UIColor.cyan,
        "magenta": UIColor.magenta,
        "orange": UIColor.orange,
        "yellow": UIColor.yellow
        // ios13以降対応なので保留
//        "systemfill": UIColor.systemFill,
//        "systemindigo": UIColor.systemIndigo,
//        "systemgray2": UIColor.systemGray2,
//        "systemgray3": UIColor.systemGray3,
//        "systemgray4": UIColor.systemGray4,
//        "systemgray5": UIColor.systemGray5,
//        "systemgray6": UIColor.systemGray6,
    ]

    // MARK: number values
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

