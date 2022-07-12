//
//  SafariView.swift
//  getKiziQiita
//
//  Created by 渡辺幹 on 2022/07/12.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    var qiitaUrl: String
    typealias UIViewControllerType = SFSafariViewController
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let url = URL(string: qiitaUrl)
        return SFSafariViewController(url: url!)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
