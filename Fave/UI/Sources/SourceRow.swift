//
//  SourceRow.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct SourceRow: View {
    let source: Source
    var body: some View {
      VStack(alignment: .leading){
          Text(source.name)
            .font(.headline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.leading)
        Text(source.description)
          .font(.footnote)
          .fontWeight(.light)
      }
    }
}



struct SourceRow_Previews: PreviewProvider {
  static var previews: some View {
    SourceRow(source: testSource[0])
  }
}
