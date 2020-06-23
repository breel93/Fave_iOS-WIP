//
//  MainViewModel.swift
//  Fave
//
//  Created by Kola Emiola on 10/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI
import Combine


final class MainViewModel : ObservableObject {
    private let apiProvider = APIProvider<NewsAPI>()
    private var bag = Set<AnyCancellable>()
    
    @Published private(set) var topHeadlines : Articles = []
    
    func getTopHeadlines(){
        apiProvider.getData(from: .getTopHeadlines).decode(type: ArticlesResponse.self, decoder:  Container.jsonDecoder)
            .map{ $0.articles }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.topHeadlines, on: self)
            .store(in: &bag)
    }
}


