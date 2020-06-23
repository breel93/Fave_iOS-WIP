//
//  ArticleRow.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ArticleRow: View {
    let article: Article
    
    @State private var shouldShowShareSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 15){
            KFImage(URL(string: article.urlToImage ?? ""))
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: (UIScreen.main.bounds.width - 32) / 2,
                       height: 260)
                .cornerRadius(12)
            
            
            Text(verbatim: article.source?.name ?? "")
                .foregroundColor(.white)
                .font(.subheadline)
                .lineLimit(nil)
                .padding([.leading, .trailing])
                .frame(width: UIScreen.main.bounds.width - 64,
                       alignment: .bottomLeading)
            
            Text(verbatim: article.title ?? "")
                .foregroundColor(.white)
                .font(.headline)
                .lineLimit(nil)
                .padding([.leading, .bottom, .trailing])
                .frame(width: UIScreen.main.bounds.width - 64,
                       alignment: .bottomLeading)

        }
        .cornerRadius(8)
        .padding([.leading, .trailing], 16)
        .padding([.top, .bottom], 8)
        .shadow(color: .black, radius: 5, x: 0, y: 0)
//        .contextMenu {
////            Button(
////                action: {
////                    LocalArticle.saveArticle(self.article)
////                    CoreDataManager.shared.saveContext()
////                },
////                label: {
////                    Text("Add to favorites")
////                    Image(systemName: "heart.fill")
////                }
////            )
//            Button(
//                action: {
//                    self.shouldShowShareSheet.toggle()
//                },
//                label: {
//                    Text("Share")
//                    Image(systemName: "square.and.arrow.up")
//                }
//            )
//        }
//        .sheet(isPresented: $shouldShowShareSheet) {
//            ActivityViewController(activityItems: [
//                self.article.title ?? "",
//                self.article.url!
//            ])
//        }
    }
    
    private var articleInfo: some View {
        VStack {
            Text(verbatim: article.source?.name ?? "")
                .foregroundColor(.white)
                .font(.subheadline)
                .lineLimit(nil)
                .padding([.leading, .trailing])
                .frame(width: UIScreen.main.bounds.width - 64,
                       alignment: .bottomLeading)
            
            Text(verbatim: article.title ?? "")
                .foregroundColor(.white)
                .font(.headline)
                .lineLimit(nil)
                .padding([.leading, .bottom, .trailing])
                .frame(width: UIScreen.main.bounds.width - 64,
                       alignment: .bottomLeading)
        }
    }
}


