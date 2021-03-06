//
//  ArticleFromCategoryView.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct ArticleFromCategoryView: View {
  @ObservedObject var viewModel = ArticleFromCategoryViewModel()

  let category: String
  var body: some View {
    VStack{
      if viewModel.articles.isEmpty{
        ActivityIndicator()
          .frame(width: UIScreen.main.bounds.width,
                 height: 50,
                 alignment: .center)
      }else{
        ArticlesList(articles: viewModel.articles)
      }
    }
    .onAppear{
      self.viewModel.getArticles(from: self.category, pageSize: "20")
    }
  }
}


struct ArticleFromCategoryView_Previews: PreviewProvider {
  static var previews: some View {
    ArticleFromCategoryView(category: "Techology")
  }
}
