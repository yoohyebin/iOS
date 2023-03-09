//
//  Bookmark.swift
//  Translator
//
//  Created by 유혜빈 on 2023/01/11.
//

import Foundation

struct Bookmark: Codable {
    let sourceLanguage: Language
    let translatedLanguage: Language

    let sourceText: String
    let translatedText: String
}
