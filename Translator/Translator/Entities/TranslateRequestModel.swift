//
//  TranslateRequestModel.swift
//  Translator
//
//  Created by 유혜빈 on 2023/01/12.
//

import Foundation

struct TranslateRequestModel: Codable {
    let source: String
    let target: String
    let text: String
}
