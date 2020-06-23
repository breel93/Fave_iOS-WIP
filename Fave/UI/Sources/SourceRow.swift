//
//  SourceRow.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct SourceRoww: View {
    let source: Source
    var body: some View {
        HStack{
            Text(source.name)
        }
    }
}


