//
//  StationResponseModel.swift
//  SubwayStation
//
//  Created by 유혜빈 on 2022/11/28.
//

import Foundation

struct StationResponseModel: Decodable {
    var stations: [Station] { searchInfo.row }

    private let searchInfo: SearchInfoBySubwayNameServiceModel

    enum CodingKeys: String, CodingKey {
        case searchInfo = "SearchInfoBySubwayNameService"
    }

    struct SearchInfoBySubwayNameServiceModel: Decodable {
        var row: [Station] = []
    }
}

struct Station: Decodable {
    let stationName: String
    let lineNumber: String

    enum CodingKeys: String, CodingKey {
        case stationName = "STATION_NM"
        case lineNumber = "LINE_NUM"
    }
}
