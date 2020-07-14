//
//  Articles.swift
//  Fave
//
//  Created by Kola Emiola on 07/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import Foundation
import SwiftUI

typealias Articles = [Article]

struct Article: Codable, Hashable {
    let title:  String?
    let author: String?
    let description: String?
    let urlToImage: String?
    let url: URL?
    let source: ArticleSource?
}

#if DEBUG
let testArticleSource = [
  ArticleSource(id: "the-verge", name: "The Verge"),
  ArticleSource(id: "ign", name: "IGN"),
  ArticleSource(id: nil, name: "MacRumors"),
  ArticleSource(id: "engadget", name: "Engadget"),
]
let testArticle = [
  Article(title:"Microsoft’s new Windows File Recovery tool lets you retrieve deleted documents - The Verge", author: "Tom Warren", description: "Microsoft has a new Windows File Recovery tool to retrieve deleted documents. It’s a command line app that works across local hard drives, SD cards, and USB external storage. You can even use it to find specific documents that have been recently deleted.", urlToImage: "https://cdn.vox-cdn.com/thumbor/Cx7xjwWQ_5-Rni4_QqQ8_zszNdY=/0x147:2040x1215/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/3905540/windows2_2040.0.jpg", url: URL(string: "https://www.theverge.com/21306670/microsoft-windows-file-recovery-tool-app-download-features"), source: testArticleSource[0]),
 Article(title:"Death Stranding Sequel Potentially Teased By Hideo Kojima - IGN - IGN", author: "Jordan Oloman", description: "Kojima's tweets have revealed a concept for this supposed new project, which features the BRIDGES logo from Death Stranding.", urlToImage: "https://assets1.ignimgs.com/2019/11/13/death-stranding-ending-explained-all-character-reveals-feature-img-1573662990852.jpg?width=1280", url: URL(string: "https://www.ign.com/articles/death-stranding-2-sequel-hideo-kojima-tweet"), source: testArticleSource[1]),
 Article(title:"'iPhone 12 Pro' Models Could Be Capable of Shooting 4K Video at 120fps and 240fps - MacRumors", author: "Tim Hardwick", description:"Two new camera modes could be coming to some models of Apple's \"iPhone 12,\" according to YouTube channel EverythingApplePro and Max...", urlToImage: "https://images.macrumors.com/article-new/2020/03/ESU6IkHU4AAS0KT.jpeg", url: URL(string: "https://www.macrumors.com/2020/06/29/iphone-12-pro-max-4k-video-120fps-240fps/"), source: testArticleSource[2]),
   Article(title:"Amazon's brand new Fire HD 8 tablets are $30 off for today only - Engadget", author: nil, description:"f you’re on the fence about purchasing the latest Fire HD tablets, Amazon has a deal that might sway you. For today only, it’s offering the all-new Fire HD for $59.99 and the Fire HD Plus for $79.99, or $30 each off the regular prices.", urlToImage: "https://o.aolcdn.com/images/dims?resize=1200%2C630&crop=1200%2C630%2C0%2C0&quality=95&image_uri=https%3A%2F%2Fs.yimg.com%2Fos%2Fcreatr-uploaded-images%2F2020-06%2F62806d80-b9e3-11ea-b7ef-8ccff6441322&client=amp-blogside-v2&signature=d12903a8d82a76611dd051cc8f23e3df19ff434e", url: URL(string: "https://www.engadget.com/amazon-fire-hd8-hd8-plus-tablets-good-deal-084627753.html"), source: testArticleSource[3])
]


#endif
