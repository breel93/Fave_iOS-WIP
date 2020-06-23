//
//  SourcesViewModel.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI
import Combine

final class SourcesViewModel: ObservableObject {
    
    private let apiProvider = APIProvider<NewsAPI>()
    
    private var bag = Set<AnyCancellable>()
    
    @Published private(set) var sources: Sources = []
    
    func getSources(){
        apiProvider.getData(from: .getSources)
            .decode(type: SourcesResponse.self, decoder: Container.jsonDecoder)
            .map { $0.sources }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.sources, on: self)
            .store(in: &bag)
    }
}

