//
//  BookmarkViewItem.swift
//  Fave
//
//  Created by Kola Emiola on 08/07/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//
import Combine
import SwiftUI
import struct Kingfisher.KFImage


struct BookmarkViewItem: View {
  let article: LocalArticle
  
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
              .lineLimit(4)
            Text(verbatim: article.source ?? "")
              .frame(alignment: .trailing)
              .foregroundColor(.black)
              .font(.caption)
              .lineLimit(nil)
          }
          .layoutPriority(100)
          Spacer()
        }
        .padding()
      }.modifier(BookMarkArticleItemModifier(article: article))
      
    }.animation(.default)
    
  }
  
  
  struct BookMarkArticleItemModifier: ViewModifier{
    @State private var showBottomSheet = false
    @State private var showSheet = false
    @State private var activeSheet: ActiveSheet = .detail
    let article: LocalArticle
    
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
              BookMarkDescriptionBottomSheet(article: self.article)
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
                    .default(Text("Full Article"), action: { self.showSheet.toggle()
                      self.activeSheet = .fullArticle
                    } ),
                    .default(Text("Share Article") , action: { self.showSheet.toggle()
                      self.activeSheet = .share
                    }),
                    .destructive(Text("Delete Article") , action: { CoreDataManager.shared.managedObjectContext.delete(self.article)
                                  CoreDataManager.shared.saveContext() }),
                    .cancel()
                  ]
      )
      
    }
  }

}



