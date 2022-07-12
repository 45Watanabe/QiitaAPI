//
//  StoryListView.swift
//  getKiziQiita
//
//  Created by 渡辺幹 on 2022/07/12.
//

import SwiftUI

struct StoryListView: View {
    @ObservedObject var manager: NewsManager = .newsManager
    var body: some View {
        NavigationView {
            List(0..<manager.newsArray.count) { num in
                NavigationLink( destination: SafariView(qiitaUrl: manager.newsArray[num].url) ){
                    ListCellView(title: manager.newsArray[num].title,
                                 name: manager.newsArray[num].user.name,
                                 url: manager.newsArray[num].url)
                }
            }.navigationTitle("Qiita記事")
        }
        
        // TODO: ナビゲーションViewを使う。
        // TODO: ListCellを縦並びで配置するForEach
        // TODO: ListCellをタップするとSafariViewを起動
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
