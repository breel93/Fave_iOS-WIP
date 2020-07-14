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
  let url: URL?
  let category: String
  let language: String
  let country: String
}

#if DEBUG
let testSource = [
  Source(id: "abc-news-au", name: "ABC News (AU)", description: "Australia's most trusted source of local, national and world news. Comprehensive, independent, in-depth analysis, the latest business, sport, weather and more.", url: URL(string: "http://www.abc.net.au/news"), category: "general", language: "en", country: "au"),
  Source(id: "bleacher-report", name: "Bleacher Report", description: "Sports journalists and bloggers covering NFL, MLB, NBA, NHL, MMA, college football and basketball, NASCAR, fantasy sports and more. News, photos, mock drafts, game scores, player profiles and more!", url: URL(string: "http://www.bleacherreport.com"), category: "sports", language: "en", country: "us"),
  Source(id: "hacker-news", name: "Hacker News", description: "Hacker News is a social news website focusing on computer science and entrepreneurship. It is run by Paul Graham's investment fund and startup incubator, Y Combinator. In general, content that can be submitted is defined as \"anything that gratifies one's intellectual curiosity\".", url: URL(string: "https://news.ycombinator.com"), category: "technology", language: "en", country: "us"),
  Source(id: "national-geographic", name: "National Geographic", description: "Reporting our world daily: original nature and science news from National Geographic.", url: URL(string:  "http://news.nationalgeographic.com"), category: "science", language: "en", country: "us")
]
#endif
