//
//  ArticlesResponse.swift
//  Fave
//
//  Created by Kola Emiola on 07/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import Foundation

struct ArticlesResponse: Codable {
    let status: String
    let articles: Articles
}
