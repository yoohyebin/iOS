//
//  OtherView.swift
//  StarbucksSampleApp
//
//  Created by 유혜빈 on 2023/01/10.
//

import SwiftUI

struct OtherView: View {
    var body: some View {
        NavigationView(){
            List{
                ForEach(Menu.allCases){ section in
                    Section(
                        header: Text(section.title)
                    ){
                        ForEach(section.menu, id: \.hashValue){ raw in
                            NavigationLink(raw, destination: Text("\(raw)"))
                        }
                    }
                }
            }
                .listStyle(GroupedListStyle())
                .navigationTitle("Other")
                .toolbar{
                    NavigationLink(destination: SettingView(),
                                   label: {
                        Image(systemName: "gear")
                    })
                }
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
