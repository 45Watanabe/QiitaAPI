//
//  TitleView.swift
//  getKiziQiita
//
//  Created by 渡辺幹 on 2022/07/10.
//

import SwiftUI

struct TitleView: View {
    @ObservedObject var manager: NewsManager = .newsManager
    var body: some View {
        if manager.isdispList {
            StoryListView()
        } else {
            title
        }
    }
    
    var title: some View {
        GeometryReader{ geo in
            ZStack{
                VStack{
                    Text("Qiita記事を読もう")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    
                    Spacer().frame(height: 100)
                    
                    if manager.isLoadStory {
                        Button(action: { manager.isdispList.toggle() }){
                            ZStack{
                                Capsule()
                                    .foregroundColor(Color.gray)
                                    .frame(width: 100, height: 50)
                                Text("読む！")
                                    .fontWeight(.black)
                                    .padding()
                                    .foregroundColor(Color.black)
                            }
                        }
                    } else {
                        ProgressView("Now Loading...")
                    }
                }
            }.frame(width: geo.size.width, height: geo.size.height)
            .background(Color.green)
        }
    }
    
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
