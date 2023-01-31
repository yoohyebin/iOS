//
//  MTMapViewError.swift
//  FindConvenienceStore
//
//  Created by 유혜빈 on 2023/01/07.
//

import Foundation

enum MTMapViewError: Error {
    case failedUpdatingCurrentLocation
    case locationAuthorizaationDenied
    
    var errorDescription: String {
        switch self {
        case .failedUpdatingCurrentLocation:
            return "현재 위치를 불러오지 못했어요. 잠시 후 다시 시도해주세요."
        case .locationAuthorizaationDenied:
            return "위치 정보를 비활성화하면 사용자의 현재 위치를 알 수 없어요."
        }
    }
}
