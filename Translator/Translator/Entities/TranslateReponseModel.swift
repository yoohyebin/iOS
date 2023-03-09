//
//  TranslateReponseModel.swift
//  Translator
//
//  Created by 유혜빈 on 2023/01/12.
//

import Foundation

struct TranslateReponseModel: Decodable {
    private let message: Message

    var translatedText: String { message.result.translatedText }

    struct Message: Decodable {
        let result: Result
    }

    struct Result: Decodable {
        let translatedText: String
    }
}
