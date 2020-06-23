//
//  TabView.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct TabedView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house.fill")
                        .font(.system(size: 22))
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 22))
            }
            SourcesView()
                .tabItem {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 22))
                }

            BookMarkView()
//                .environment(\.managedObjectContext, context)
                .tabItem {
                    Image(systemName: "folder.fill")
                        .font(.system(size: 22))
                }
            
        }
        .accentColor(.blue)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabedView()
    }
}
