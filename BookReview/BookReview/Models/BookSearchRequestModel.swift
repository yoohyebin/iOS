//
//  BookSearchRequestModel.swift
//  BookReview
//
//  Created by 유혜빈 on 2023/01/13.
//

import Foundation

struct BookSearchRequestModel: Codable {
    /// 검색할 책 키워드
    let query: String
}
