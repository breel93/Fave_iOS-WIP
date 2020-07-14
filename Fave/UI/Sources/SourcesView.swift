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
  private var categories: [String] = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
  @State var category = ""
  
  var body: some View {
    NavigationView(content:  {
      VStack {
        
        if viewModel.sources.isEmpty {
          ActivityIndicator()
            .frame(width: UIScreen.main.bounds.width,
                   height: 50,
                   alignment: .center)
        } else{
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
              ForEach(self.categories, id: \.self) { i in
                CategoryCard(category:i).onTapGesture {
                  self.viewModel.getSources(from: i)
                }
              }
            }
          }
          .padding(.leading)
          .padding(.trailing)
          List(viewModel.sources, id: \.self){ source in
            NavigationLink(
              destination: SourceArticlesView(source: source)
                .navigationBarTitle(Text(source.name)),
              label: {
                SourceRow(source: source)
              }
            )
          }
          .listStyle(GroupedListStyle())
          .environment(\.horizontalSizeClass, .regular)
          .animation(.spring())
        }
      }
      .onAppear{
        self.viewModel.getSources(from: self.category)
      }
      .navigationBarTitle(Text("Sources"), displayMode: .large)
    })
  }
}

struct CategoryCard: View {
  let category: String
  var body: some View{
    VStack(alignment: .leading){
      Text(category)
        .padding(5)
    } .background(Color.black.opacity(0.05))
      .cornerRadius(5)
      .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
  }
}

struct SourcesView_Previews: PreviewProvider {
  static var previews: some View {
    SourcesView()
  }
}

