//
//  CategoriesArticleViewModel.swift
//  Fave
//
//  Created by Kola Emiola on 03/07/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI
import Combine

final class CategoriesArticleViewModel  : ObservableObject {
  private let apiProvider = APIProvider<NewsAPI>()
  private var bag = Set<AnyCancellable>()
  
  @Published private(set) var articles: Articles = []
  
  
  
  private var categories: [String] = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
  
  
  func getArticles(category : String){
    
    apiProvider.getData(from:
      NewsAPI.getArticlesCategory(category, "3"))
      .decode(type: ArticlesResponse.self, decoder: Container.jsonDecoder)
      .map{ $0.articles }
      .replaceError(with: [])
      .receive(on: RunLoop.main)
      .assign(to: \.articles, on: self)
      .store(in: &bag)
    print(category)
  }
  
//  func getIt(category : String) -> Articles {
//    let listArticles: Articles = []
//    apiProvider.getData(from:
//      NewsAPI.getArticlesCategory(category, "3"))
//      .decode(type: ArticlesResponse.self, decoder: Container.jsonDecoder)
//      .map{ $0.articles }
//      .replaceError(with: [])
//      .receive(on: RunLoop.main)
//      .assign(to: listArticles, on: self)
//      .store(in: &bag)
//    return listArticles
//  }

  
}



