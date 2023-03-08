//
//  Events.swift
//  StarbucksSampleApp
//
//  Created by 유혜빈 on 2023/01/10.
//

import SwiftUI

struct Events: Identifiable{
    let id = UUID()
    
    let image: Image
    let title: String
    let description: String
}
