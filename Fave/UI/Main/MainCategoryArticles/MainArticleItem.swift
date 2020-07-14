//
//  MainArticleItem.swift
//  Fave
//
//  Created by Kola Emiola on 03/07/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import Combine
import SwiftUI
import struct Kingfisher.KFImage

struct MainArticleItem : View {
  let article: Article
  @State private var showBottomSheet = false
  @State private var showDetailBottomSheet = false
  var body: some View{
    ZStack{
      HStack{
        KFImage(URL(string: article.urlToImage ?? ""))
          .renderingMode(.original)
          .resizable()
          .scaledToFill()
          .frame(width:100,
                 height: 100)
          .cornerRadius(10)
        VStack(alignment: .leading){
          Text(article.title ?? "")
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.leading)
             .lineLimit(nil)
            .padding(.bottom)
            .frame(height: 100.0)
        }
      }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
      .padding(5.0)
    }
    
  }
}

struct MainArticleItem_Previews: PreviewProvider {
  static var previews: some View {
    MainArticleItem(article:testArticle[0])
  }
}
