//
//  TopHeadlinesView.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct TopHeadlinesView: View {
  let topHeadlines: Articles
  
  var body: some View {
    PageView(topHeadlines.map { TopHeadlineRow(article: $0) })
  }
}


struct TopHeadlinesView_Previews: PreviewProvider {
  static var previews: some View {
    TopHeadlinesView(topHeadlines: testArticle)
  }
}
