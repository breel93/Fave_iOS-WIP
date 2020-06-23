//
//  Articles.swift
//  Fave
//
//  Created by Kola Emiola on 07/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import Foundation

typealias Articles = [Article]

struct Article: Codable, Hashable {
    let title:  String?
    let author: String?
    let description: String?
    let urlToImage: String?
    let url: URL?
    let source: ArticleSource?
}
