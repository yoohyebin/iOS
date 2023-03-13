//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by 유혜빈 on 2023/01/13.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    var items: [Book] = []
}
