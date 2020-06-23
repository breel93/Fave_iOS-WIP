//
//  PageView.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    private let viewControllers: [UIHostingController<Page>]
    init(_ views : [Page]){
        self.viewControllers = views.map{UIHostingController(rootView: $0)}
    }
    var body: some View {
      PageViewController(controllers: viewControllers)
    }
}

