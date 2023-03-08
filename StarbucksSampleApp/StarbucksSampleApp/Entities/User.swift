//
//  User.swift
//  StarbucksSampleApp
//
//  Created by 유혜빈 on 2023/01/10.
//

import SwiftUI

struct User {
    let username: String
    let account: String

    static let shared = User(username: "혜빈", account: "hyebin")
}
