//
//  FindCovidCenterApp.swift
//  FindCovidCenter
//
//  Created by 유혜빈 on 2023/01/09.
//

import SwiftUI

@main
struct FindCovidCenterApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = SelectRegionViewModel()
            SelectRegionView(viewModel: viewModel)
        }
    }
}
