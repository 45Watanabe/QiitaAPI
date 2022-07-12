//
//  NewsList.swift
//  getKiziQiita
//
//  Created by 渡辺幹 on 2022/07/10.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject var manager: NewsManager = .newsManager
    var body: some View {
        VStack {
            ForEach(0..<manager.newsArray.count){ i in
                Text("\(manager.newsArray[i].title)")
                Text("\(manager.newsArray[i].user.name)")
                Text("\(manager.newsArray[i].url)")
            }
        }
    }
}

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
