//
//  NewsManager.swift
//  getKiziQiita
//
//  Created by 渡辺幹 on 2022/07/10.
//

import SwiftUI
import Combine

struct QiitaStruct: Codable {
    var title: String
    var url: String
    var user: User
    struct User: Codable {
        var name: String
    }
}

class NewsManager: ObservableObject {
    private init(){
        getStory()
    }
    static let newsManager = NewsManager()
    
    @Published var isLoadStory = false
    @Published var isdispList = false
    
    var disposable = Set<AnyCancellable>()
    @Published var newsArray: [QiitaStruct] = []
    
    
    func getStory() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let url = URL(string: "https://qiita.com/api/v2/items?per_page=50")!
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map({ (data, response) in
                return data
            })
            .decode(type: [QiitaStruct].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("error ： " + error.localizedDescription)
                case .finished:
                    print("----------success-----------")
                }
            }, receiveValue: { [weak self] qiita in
                self?.newsArray = qiita
                //print(qiita)
                print(self?.newsArray as Any)
                self?.isLoadStory = true
            })
            .store(in: &disposable)
    }
    
//    func getData() {
//        let cancellable = URLSession.shared.dataTaskPublisher(for: request)
//            .map({(data, response) in
//                return data
//            })
//            .decode(type: [QiitaStruct].self, decoder: decoder)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .failure(let error):
//                    print("エラー:"+error.localizedDescription)
//                case .finished:
//                    print("---終了---")
//                }
//            }, receiveValue: { qiita in
//                print("abc")
//                for qiita in qiita {
//                    //self.newsArray.append(qiita)
//                    print(qiita)
//                }
//            } )
//    }
    
}


