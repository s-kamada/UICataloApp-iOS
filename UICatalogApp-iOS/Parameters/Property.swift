//
//  Property.swift
//  UICatalogApp-iOS
//
//  Created by 鎌田峻輔 on 2020/08/04.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

enum LabelProperty {
    case boolProperty

    var status: Bool {
        switch self {
        case .boolProperty:
            return true
        default:
            return false
        }
    }
}
