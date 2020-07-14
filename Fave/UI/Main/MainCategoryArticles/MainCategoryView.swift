//
//  MainCategoryView.swift
//  Fave
//
//  Created by Kola Emiola on 06/07/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct MainCategoryView: View {
  @ObservedObject var articleViewModel = CategoriesArticleViewModel()
  var categories: [String] = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
 
  var body: some View {
    Section(header: Text(verbatim: "Categories")) {
      
      ForEach(categories, id: \.self){ category in
        VStack{
          Text(category)
        }
        .onAppear {
          articleViewModel.getArticles(category: category)
        }
      }
    }
  }
}

struct ArticleLon: View {
  let articles: Articles
  var body: some View{
    ForEach(articles, id: \.self ){ article in
      MainArticleItem(article: article)
    }
  }
}

struct MainCategoryView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      MainCategoryView()
    }
  }
}
