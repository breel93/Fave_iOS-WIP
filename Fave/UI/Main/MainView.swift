//
//  MainView.swift
//  Fave
//
//  Created by Kola Emiola on 10/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct MainView : View {
  @ObservedObject var viewModel = MainViewModel()
  var categories: [String] = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
  
  var body: some View {
    NavigationView(content: {
      mainViewList
        .animation(.spring())
        .onAppear(perform: {
          self.viewModel.getTopHeadlines()
        })
        .navigationBarTitle(Text("Top Stories"), displayMode:.automatic)
    })
  }
  
  private var mainViewList: some View {
    List {
      if viewModel.topHeadlines.isEmpty {
        ActivityIndicator()
      } else {
        TopHeadlinesView(topHeadlines: viewModel.topHeadlines)
          .frame(height: UIScreen.main.bounds.width / 4 * 3,
                 alignment: .center)
          .clipped()
          .listRowInsets(EdgeInsets())
      }
      Section(header: Text(verbatim: "Categories")) {
        ForEach(categories, id: \.self) { category in
          NavigationLink(
            destination: ArticleFromCategoryView(category: category)
              .navigationBarTitle(Text(category), displayMode: .large)
          ) {
            Text(category)
          }
        }
      }
    }
    .listStyle(GroupedListStyle())
    .environment(\.horizontalSizeClass, .regular)
  }
}




struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}

