//
//  SourcesView.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct SourcesView: View {
    @ObservedObject var viewModel = SourcesViewModel()

    var body: some View {
        NavigationView(content:  {
            VStack {
                if viewModel.sources.isEmpty {
                    ActivityIndicator()
                         .frame(width: UIScreen.main.bounds.width,
                                height: 50,
                                alignment: .center)
                } else{
                    List(viewModel.sources, id: \.self){ source in
                        NavigationLink(
                            destination: SourceArticlesView(source: source)
                                .navigationBarTitle(Text(source.name)),
                            label: {
                                Text(source.name)
                            }
                        )
                    }
                .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                    .animation(.spring())
                }
            }
            .onAppear{
                self.viewModel.getSources()
            }
        .navigationBarTitle(Text("Sources"), displayMode: .large)
        })
    }
}

struct SourcesView_Previews: PreviewProvider {
    static var previews: some View {
        SourcesView()
    }
}
