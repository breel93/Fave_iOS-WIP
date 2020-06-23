//
//  SourceArticlesView.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct SourceArticlesView: View {
    @ObservedObject var viewModel = SourceArticlesViewModel()
    @State var shouldPresent: Bool = false
    @State var articleURL : URL?
    let source : Source
    var body: some View {
        mainView.onAppear(perform: {
            self.viewModel.getArticles(from: self.source.id)
        }).sheet(isPresented: $shouldPresent){
            SafariView(url: self.articleURL!)
        }
        .navigationBarItems(trailing:
            HStack{
                Button(
                    action:{
                        UIApplication.shared.open(self.source.url)
                    },
                    label: {
                        Image(systemName: "Safari").imageScale(.large)
                    }
                )
            }
        )
        
    }
    
    private var mainView: some View{
        VStack {
            if viewModel.articles.isEmpty {
                ActivityIndicator()
                    .frame(width: UIScreen.main.bounds.width,
                           height: 50,
                           alignment: .center)
            } else {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center) {
                        if self.source.description != nil {
                            Text(verbatim: "About source:\n" + (source.description ?? ""))
                                .lineLimit(nil)
                                .frame(width: UIScreen.main.bounds.width - 32,
                                       height: 150,
                                       alignment: .center)
                        }
                        ForEach(viewModel.articles, id: \.self) { article in
                            ArticleRow(article: article)
                            .animation(.spring())
                            .onTapGesture {
                                self.articleURL = article.url
                                self.shouldPresent = true
                            }
                        }
                    }
                    .animation(.spring())
                }
            }
        }
    }
}

