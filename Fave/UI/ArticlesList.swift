//
//  ArticlesList.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct ArticlesList: View {
    @State var shouldPresent: Bool = false
    @State var articleURL: URL?
    @State var articles: [Article]
    @State var Grid : [Int] = []
    var body: some View {
        VStack(spacing: 0){
            MainListView(articles: self.$articles, Grid: self.$Grid)
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.top))
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            self.generateGrid()
        }
    }
    
    func generateGrid(){
        for i in stride(from: 0, to: self.articles.count, by: 2){
                   
            if i != self.articles.count{
                       
                self.Grid.append(i)
            }
                   
        }
    }

    
    
//    ScrollView{
//    VStack(alignment: .center){
//        ForEach(articles, id: \.self) { article in
//            ArticleRow(article: article)
//                .animation(.spring())
//                .onTapGesture {
//                    self.articleURL = article.url
//                    self.shouldPresent = true
//            }
//        }
//    }
//    .sheet(isPresented: $shouldPresent) {
//        SafariView(url: self.articleURL!)
//    }
//}
}

struct MainListView: View {
    @Binding var articles: [Article]
    @Binding var Grid : [Int]
    
    var body: some View{
        VStack {
            
            if !self.Grid.isEmpty{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing : 25){
                        
                        ForEach(self.Grid,id: \.self){i in
                            
                            HStack(spacing: 15){
                                
                                ForEach(i...i+1,id: \.self){j in
                                    
                                    VStack{
                                        
                                        if j != self.articles.count{
                                            
                                            ArticleRow(article: self.articles[j])
                                        }
                                    }
                                    
                                }
                                
                                if i == self.Grid.last! && self.articles.count % 2 != 0{
                                    
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }

        }
    }
}

