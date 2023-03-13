//
//  BookReview.swift
//  BookReview
//
//  Created by 유혜빈 on 2023/01/13.
//

import Foundation

struct BookReview: Codable {
    let title: String
    let contents: String
    let imageURL: URL?
}
