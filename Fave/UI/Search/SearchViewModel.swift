//
//  SearchViewModel.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI
import Combine

final class SearchViewModel: ObservableObject {
  private let apiProvider = APIProvider<NewsAPI>()
  
  private var bag = Set<AnyCancellable>()
  
  @Published var searchText: String = "" {
    didSet {
      searchForArticles(searchFilter: searchText)
    }
  }
  @Published private (set) var articles: Articles = []
  
  func searchForArticles(searchFilter: String) {
    apiProvider.getData(from: .searchForArcticles(searchFilter: searchFilter))
      .decode(type: ArticlesResponse.self, decoder: Container.jsonDecoder)
      .map { $0.articles }
      .replaceError(with: [])
      .receive(on: RunLoop.main)
      .sink(receiveValue: { [weak self] articles in
        self?.articles = articles
      })
      .store(in: &bag)
  }
}
