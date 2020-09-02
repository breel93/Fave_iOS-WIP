//
//  SearchView.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct SearchView: View {
  @ObservedObject var viewModel = SearchViewModel()
  var body: some View {
    NavigationView(content: {
      VStack{
        SearchBarView(searchText: $viewModel.searchText)
          .padding([.leading, .trailing], 8)
        ArticlesList(articles: viewModel.articles)
      }
      .navigationBarTitle(Text(Constants.title), displayMode:.automatic)
      .resignKeyboardOnDragGesture()
    })
  }
}

private extension SearchView {
  
  struct Constants {
    static let title = "Search"
  }
}

#if DEBUG
struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView(viewModel: SearchViewModel())
  }
}
#endif
