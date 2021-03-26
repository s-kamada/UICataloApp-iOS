//
//  Parameter.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2020/07/13.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

struct Property {
    let title: String
    let description: String
    let type: ParameterType
    let option: KeyValuePairs<String, Any>?
}

enum ParameterType {
    case bool
    case string
    case number
    case choice
    case multiChoice
    case button
}

protocol Chooseable {}
