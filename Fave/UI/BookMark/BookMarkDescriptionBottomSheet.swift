//
//  BookMarkDescriptionBottomSheet.swift
//  Fave
//
//  Created by Kola Emiola on 13/07/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import Combine
import SwiftUI
import struct Kingfisher.KFImage

struct BookMarkDescriptionBottomSheet: View {
  let article: LocalArticle
  var body: some View {
    
    VStack{
      KFImage(URL(string: article.urlToImage ?? ""))
        .renderingMode(.original)
        .resizable()
        .scaledToFill()
        .frame(width: UIScreen.main.bounds.width - 20,
               height: 300,
               alignment: .center)
        .cornerRadius(10)
        .padding(.horizontal)
      Text(article.title ?? "")
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundColor(Color.black)
        .padding()
      Text(article.articleDescription ?? "" )
        .font(.body)
        .fontWeight(.regular)
        .padding(.horizontal)
    }
    .animation(.default)
    .padding(.horizontal)
  }
}
