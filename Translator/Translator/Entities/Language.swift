//
//  Language.swift
//  Translator
//
//  Created by 유혜빈 on 2023/01/11.
//

import Foundation

enum Language: String, CaseIterable, Codable {
    case ko
    case en
    case ja
    case ch = "zn-CN"

    var title: String {
        switch self {
        case .ko: return NSLocalizedString("Korean", comment: "한국어")
        case .en: return NSLocalizedString("English", comment: "영어")
        case .ja: return NSLocalizedString("Japanese", comment: "일본어")
        case .ch: return NSLocalizedString("Chinese", comment: "중국어")
        }
    }

    var languageCode: String {
        self.rawValue
    }
}
