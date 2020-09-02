//
//  ArticlesList.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI


struct ArticlesList: View {
  @State var articles: Articles
  var columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 2)
  
  var body: some View {
    VStack {
      ScrollView(.vertical, showsIndicators: false) {
        LazyVGrid(columns: columns,spacing: 5){
          ForEach(articles, id: \.self){ article in  
            ArticleItem(article: article)
          }
        }.padding([.horizontal,.bottom])
      }
    }.animation(.default)
  }
}




struct ArticlesList_Previews: PreviewProvider {
  static var previews: some View {
    ArticlesList(articles: testArticle)
  }
}
