//
//  CenterAPIResponse.swift
//  FindCovidCenter
//
//  Created by 유혜빈 on 2023/01/09.
//

import Foundation

struct CenterAPIResponse: Decodable {
    let data: [Center]
}
