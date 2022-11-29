//
//  RankingFeature.swift
//  AppStore
//
//  Created by 유혜빈 on 2022/11/28.
//

import Foundation

struct RankingFeature: Decodable {
    let title: String
    let description: String
    let isInPurchaseApp: Bool
}
