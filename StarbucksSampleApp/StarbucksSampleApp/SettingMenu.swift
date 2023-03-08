//
//  SettingMenu.swift
//  StarbucksSampleApp
//
//  Created by 유혜빈 on 2023/01/10.
//

import Foundation

enum Menu: String, CaseIterable, Identifiable {
    case service = "서비스"
    case cs = "고객지원"
    case terms = "약관 및 정책"

    var title: String { rawValue }
    var id: String { rawValue }

    var menu: [String] {
        switch self {
        case .service: return Service.allCases.map { $0.title }
        case .cs: return CS.allCases.map { $0.title }
        case .terms: return Terms.allCases.map { $0.title }
        }
    }

    enum Service: String, CaseIterable, Identifiable {
        case frequency = "프리퀀시"
        case reward = "리워드"
        case coupon = "쿠폰"
        case giftCard = "e-기프트카드"
        case new = "What's New"
        case notification = "알림"
        case history = "히스토리"
        case receipt = "전자영수증"
        case myReview = "마이 스타벅스 리뷰"

        var title: String { rawValue }
        var id: String { rawValue }
    }

    enum CS: String, CaseIterable, Identifiable {
        case storeCare = "스토어 케어"
        case voiceOfCustomer = "고객의 소리"
        case store = "매장 정보"

        var title: String { rawValue }
        var id: String { rawValue }
    }

    enum Terms: String, CaseIterable, Identifiable {
        case terms = "이용약관"
        case privacyTerms = "개인정보 처리 방침"

        var title: String { rawValue }
        var id: String { rawValue }
    }
}
