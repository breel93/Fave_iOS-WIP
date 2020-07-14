//
//  BookMarkView.swift
//  Fave
//
//  Created by Kola Emiola on 15/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct BookMarkView: View {
  @Environment(\.managedObjectContext) var managedObjectContext
  @FetchRequest(entity: LocalArticle.entity(), sortDescriptors: [
    NSSortDescriptor(key: "savingDate", ascending: false)
  ]) var articles: FetchedResults<LocalArticle>
  var columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 2)
  
  var body: some View {
    NavigationView {
      VStack {
        ScrollView(.vertical, showsIndicators: false) {
          LazyVGrid(columns: columns,spacing: 5){
            ForEach(articles, id: \.self){ article in
              BookmarkViewItem(article: article)
            }
          }.padding([.horizontal,.bottom])
        }
      }.animation(.default)
      .navigationBarTitle(Text("BookMarks"), displayMode: .automatic)
    }
  }
}

struct BookMarkView_Previews: PreviewProvider {
  static var previews: some View {
    BookMarkView()
  }
}
