//
//  CategoryModel.swift
//  Fave
//
//  Created by Kola Emiola on 03/07/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import Foundation
import SwiftUI

typealias CategoryModels = [CategoryModel]
struct CategoryModel {
  let title:  String?
  let articles: Articles?
}
private var categories: [String] = ["business", "entertainment", "general", "health", "science", "sports", "technology"]

let testCategoryModels = [
  CategoryModel(title:categories[0], articles: testArticle),
  CategoryModel(title:categories[1], articles: testArticle),
  CategoryModel(title:categories[2], articles: testArticle),
  CategoryModel(title:categories[3], articles: testArticle),
  CategoryModel(title:categories[4], articles: testArticle),
  CategoryModel(title:categories[5], articles: testArticle),
  CategoryModel(title:categories[5], articles: testArticle)
]
