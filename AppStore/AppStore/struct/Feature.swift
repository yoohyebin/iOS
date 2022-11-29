//
//  Feature.swift
//  AppStore
//
//  Created by 유혜빈 on 2022/11/28.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
