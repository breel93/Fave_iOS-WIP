//
//  Sources.swift
//  Fave
//
//  Created by Kola Emiola on 08/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import Foundation

typealias Sources = [Source]
struct Source : Codable, Hashable {
    let id : String
    let name: String
    let description: String
    let url: URL
    let category: String
    let language: String
    let country: String
}
