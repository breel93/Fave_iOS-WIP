//
//  ArtcileFromCategoryViewModel.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI
import Combine

final class ArticleFromCategoryViewModel: ObservableObject {
  private let apiProvider = APIProvider<NewsAPI>()
  private var bag = Set<AnyCancellable>()
  @Published private(set) var articles: Articles = []
  func getArticles(from category: String, pageSize: String){
    apiProvider.getData(from: NewsAPI.getArticlesCategory(category, pageSize))
      .decode(type: ArticlesResponse.self, decoder: Container.jsonDecoder)
      .map{ $0.articles }
      .replaceError(with: [])
      .receive(on: RunLoop.main)
      .assign(to: \.articles, on: self)
      .store(in: &bag)
  }
  
}
