//
//  SettingView.swift
//  StarbucksSampleApp
//
//  Created by 유혜빈 on 2023/01/10.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List{
            Section{
                SettingUserInfoSectionView()
            }
            Button("회원 정보 수정") {}
                .accentColor(.black)
            Button("회원 탈퇴") {}
                .accentColor(.black)
        }
        .navigationTitle("설정")
        .listStyle(GroupedListStyle())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingUserInfoSectionView: View{
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 4.0){
                Text(User.shared.username)
                    .font(.title)
                Text(User.shared.account)
                    .font(.caption)
            }
            Spacer()
            Button(action: {},
                   label: {
                Text("로그아웃")
                    .accentColor(.green)
                    .font(.system(size: 14.0, weight: .bold, design: .default))
            })
            .padding(8.0)
            .overlay(Capsule().stroke(Color.green))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
