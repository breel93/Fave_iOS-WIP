//
//  TopHeadlineRow.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//


import Combine
import struct Kingfisher.KFImage
import SwiftUI

struct TopHeadlineRow : View {
  @State private var shouldPresentURL: Bool = false
  @State private var shouldShowShareSheet: Bool = false
  
  var article: Article
  
  var body: some View {
    ZStack(alignment: .bottom) {
      KFImage(URL(string: article.urlToImage ?? ""))
        .resizable()
        .frame(width: UIScreen.main.bounds.width-15,
               height: UIScreen.main.bounds.width / 4 * 3,
               alignment: .center)
        .cornerRadius(10)
      
      Rectangle()
        .foregroundColor(.black)
        .opacity(0.6)
        .frame(width: UIScreen.main.bounds.width-15,
               height: UIScreen.main.bounds.width / 4 * 3,
               alignment: .center)
        .cornerRadius(10)
      
      Button(
        action: {
          self.shouldPresentURL = true
      },
        label: {
          topHeadlineInfo
        }
      )
    }
    .frame(width: UIScreen.main.bounds.width-15,
           height: UIScreen.main.bounds.width / 4 * 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    .padding([.leading, .trailing])
    .cornerRadius(10)
    .contextMenu {
      Button(
        action: {
          self.shouldShowShareSheet.toggle()
      },
        label: {
          Text("Share")
          Image(systemName: "square.and.arrow.up")
      }
      )
    }
    .sheet(isPresented: $shouldPresentURL) {
      SafariView(url: self.article.url!)
    }
    .sheet(isPresented: $shouldShowShareSheet) {
      ActivityViewController(activityItems: [
        self.article.title ?? "",
        self.article.url!
      ])
    }
  }
  
  private var topHeadlineInfo: some View {
    VStack(alignment: .leading) {
      Text(verbatim: article.source?.name ?? "")
        .foregroundColor(.white)
        .font(.subheadline)
        .lineLimit(nil)
        .padding([.leading, .trailing])
      
      Text(verbatim: article.title ?? "")
        .foregroundColor(.white)
        .font(.headline)
        .lineLimit(nil)
        .padding([.leading, .bottom, .trailing])
    }
  }
}

struct TopHeadlineRow_Previews: PreviewProvider {
  static var previews: some View {
    TopHeadlineRow(article: testArticle[0])
      .padding(.horizontal, 0.0)
  }
}
