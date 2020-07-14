//
//  DescriptionBottomSheet.swift
//  Fave
//
//  Created by Kola Emiola on 24/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import Combine
import SwiftUI
import struct Kingfisher.KFImage


struct DescriptionBottomSheet: View {
  let article: Article
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
      Text(article.description ??  "")
        .font(.body)
        .fontWeight(.regular)
        .padding(.horizontal)
    }
    .animation(.default)
    .padding(.horizontal)
  }
}




struct DescriptionBottomSheet_Previews: PreviewProvider {
  static var previews: some View {
    DescriptionBottomSheet(article:testArticle[0])
  }
}


