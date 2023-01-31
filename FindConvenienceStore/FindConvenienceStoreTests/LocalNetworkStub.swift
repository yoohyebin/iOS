//
//  LocalNetworkStub.swift
//  FindConvenienceStoreTests
//
//  Created by 유혜빈 on 2023/01/07.
//

import Foundation
import RxSwift
import Stubber

@testable import FindConvenienceStore

class LocalNetworkStub: LocalNetwork {
    override func getLocation(by mapPoint: MTMapPoint) -> Single<Result<LocationData, URLError>> {
        return Stubber.invoke(getLocation, args: mapPoint)
    }
}

