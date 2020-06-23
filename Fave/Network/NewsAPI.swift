//
//  NewsAPI.swift
//  Fave
//
//  Created by Kola Emiola on 08/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import Foundation

enum NewsAPI : EndpointProtocol {
    case getTopHeadlines
    case getArticlesCategory(_ category: String)
    case getSources
    case getArticlesFromSource(_ source: String)
    case searchForArcticles (searchFilter : String)
    
    var baseURL: String{
        return "https://newsapi.org/v2"
    }
    var absoluteURL: String {
           switch self {
           case .getTopHeadlines, .getArticlesCategory:
               return baseURL + "/top-headlines"
               
           case .getSources:
               return baseURL + "/sources"
               
           case .getArticlesFromSource, .searchForArcticles:
               return baseURL + "/everything"
           }
    }
       
    var params: [String: String] {
           switch self {
           case .getTopHeadlines:
               return ["country": region]
               
           case let .getArticlesCategory(category):
               return ["country": region, "category": category]
               
           case .getSources:
               return ["language": locale, "country": region]
               
           case let .getArticlesFromSource(source):
               return ["sources": source, "language": locale]
               
           case let .searchForArcticles(searchFilter):
            return ["q": searchFilter, "language": locale]
           }
    }
       
    var headers: [String: String] {
        return [
            "X-Api-Key": Container.newsAPIKey,
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
    
}
