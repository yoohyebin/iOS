//
//  Type.swift
//  Translator
//
//  Created by 유혜빈 on 2023/01/11.
//

import UIKit

enum `Type` {
    case source
    case target

    var color: UIColor {
        switch self {
        case .source: return .label
        case .target: return .mainTintColor
        }
    }
}
