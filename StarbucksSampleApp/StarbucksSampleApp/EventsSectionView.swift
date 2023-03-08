//
//  EventsSectionView.swift
//  StarbucksSampleApp
//
//  Created by 유혜빈 on 2023/01/10.
//

import SwiftUI

struct EventsSectionView: View {
    @Binding var events: [Events]

    var body: some View {
        VStack{
            HStack{
                Text("Events")
                    .font(.headline)
                Spacer()
                Button("See all") {}
                    .accentColor(.green)
                    .font(.subheadline)
            }
            .padding(.horizontal, 16.0)
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack{
                    ForEach(events){ event in
                        EventsSectionItemView(event: event)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 220, maxHeight: .infinity)
                .padding(.horizontal, 16.0)
            }
        }
    }
}

struct EventsSectionItemView: View {
    let event: Events

    var body: some View {
        VStack{
            event.image
                .resizable()
                .scaledToFill()
                .frame(height: 150.0)
                .clipped()
            Text(event.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
            Text(event.description)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .font(.callout)
        }
        .frame(width: UIScreen.main.bounds.width - 32.0)
    }
}

/*
struct EventsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        EventsSectionView()
    }
}
*/
