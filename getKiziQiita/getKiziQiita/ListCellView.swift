//
//  ListCellView.swift
//  getKiziQiita
//
//  Created by 渡辺幹 on 2022/07/12.
//

import SwiftUI

struct ListCellView: View {
    var title: String
    var name: String
    var url: String
    var body: some View {
        VStack{
            ScrollView(.horizontal) {
                Text("\(title)")
            }
            Text("\(name)")
                .font(.callout)
            ScrollView(.horizontal) {
                Text("\(url)") //とてもちさく
                    .font(.caption2)
            }
        }
    }
}
