//
//  CenterList.swift
//  FindCovidCenter
//
//  Created by 유혜빈 on 2023/01/09.
//

import SwiftUI

struct CenterList: View {
    var centers = [Center]()
    
    var body: some View {
        List(centers, id: \.id) { center in
            NavigationLink(destination: CenterDetailView(center: center)) {
                CenterRow(center: center)
            }
            .navigationTitle(center.sido.rawValue)
        }
    }
}

struct CenterList_Previews: PreviewProvider {
    static var previews: some View {
        let centers = [
            Center(id: 0, sido: .경기도, facilityName: "실내빙상장 앞", address: "경기도 안양시 동안구 평촌대로 389", lat: "37.404476", lng: "126.9491998", centerType: .local, phoneNumber: "031-8045-4843"),
            Center(id: 1, sido: .경기도, facilityName: "실내빙상장 앞", address: "경기도 안양시 동안구 평촌대로 389", lat: "37.404476", lng: "126.9491998", centerType: .local, phoneNumber: "031-8045-4843"),
            Center(id: 2, sido: .경기도, facilityName: "실내빙상장 앞", address: "경기도 안양시 동안구 평촌대로 389", lat: "37.404476", lng: "126.9491998", centerType: .local, phoneNumber: "031-8045-4843")
        ]
        CenterList(centers: centers)
    }
}
