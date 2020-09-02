//
//  ArticleRow.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//
import Combine
import SwiftUI
import struct Kingfisher.KFImage

enum ActiveSheet {
  case fullArticle, share, detail
}
struct ArticleItem: View {
  let article: Article
  
  @State private var showBottomSheet = false
  @State private var showSheet = false
  @State private var activeSheet: ActiveSheet = .detail
  
  var body: some View {
    
    ZStack {
      VStack{
        KFImage(URL(string: article.urlToImage ?? ""))
          .renderingMode(.original)
          .resizable()
          .scaledToFill()
          .frame(width: (UIScreen.main.bounds.width - 45) / 2,
                 height: 150)
        HStack {
          VStack(alignment: .leading) {
            Text(verbatim: article.title ?? "")
              .foregroundColor(.primary)
              .font(.caption)
//              .lineLimit(3)
            Text(verbatim: article.source?.name ?? "")
              .frame(alignment: .trailing)
              .foregroundColor(.black)
              .font(.caption)
              .lineLimit(nil)
          }
          .layoutPriority(100)
          Spacer()
        }
        .padding()
      }.modifier(ArticleItemModifier(article: article))
    
      
    }.animation(.default)
  }
  
  struct ArticleItemModifier: ViewModifier{
    @State private var showBottomSheet = false
    @State private var showSheet = false
    @State private var activeSheet: ActiveSheet = .detail
    let article: Article
    
    func body(content: Content) -> some View {
      content
        .actionSheet(isPresented: $showBottomSheet,
                     content: { self.actionSheet })
        .sheet(isPresented: $showSheet){
          switch self.activeSheet{
            case .fullArticle:
              SafariView(url: self.article.url!)
            case .share:
              ActivityViewController(activityItems: [
                self.article.title ?? "",
                self.article.url!
              ])
            case .detail:
              DescriptionBottomSheet(article: self.article)
          }
        }
        .cornerRadius(5)
        .overlay(
          RoundedRectangle(cornerRadius: 5)
            .stroke(Color(.sRGB, red: 150/255,
                          green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
        .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 260 )
        .onTapGesture {self.showSheet.toggle()
          self.activeSheet = .detail }
        .onLongPressGesture {
          self.showBottomSheet.toggle() }
    }
    
    var actionSheet : ActionSheet {
      ActionSheet(title: Text("Fave"),
                  message: Text("Select Option"),
                  buttons: [
                    .default(Text("Add to BookMark"), action: { LocalArticle.saveArticle(self.article)
                              CoreDataManager.shared.saveContext()}),
                    .default(Text("Full Article"), action: { self.showSheet.toggle()
                      self.activeSheet = .fullArticle
                    } ),
                    .default(Text("Share Article") , action: { self.showSheet.toggle()
                      self.activeSheet = .share
                    }),
                    .cancel()
                  ]
      )
    }
  }
  
  
  
  struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
      ArticleItem(article:testArticle[0])
    }
  }
  
  
}
