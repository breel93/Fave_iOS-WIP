//
//  SearchBarView.swift
//  Fave
//
//  Created by Kola Emiola on 12/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct SearchBarView: View {
  
  @Binding var searchText: String
  @State private var showCancelButton: Bool = false
  
  var body: some View {
    // Search view
    HStack {
      HStack {
        Image(systemName: "magnifyingglass")
        
        TextField("search", text: $searchText, onEditingChanged: { isEditing in
          self.showCancelButton = true
        }, onCommit: {
          print("onCommit")
        }).foregroundColor(.primary)
        
        Button(action: {
          self.searchText = ""
        }) {
          Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
        }
      }
      .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
      .foregroundColor(.secondary)
      .background(Color(.secondarySystemBackground))
      .cornerRadius(10.0)
      
      if showCancelButton  {
        Button("Cancel") {
          UIApplication.shared.endEditing(true) // this must be placed before the other commands here
          self.searchText = ""
          self.showCancelButton = false
        }
        .foregroundColor(Color(.systemBlue))
      }
    }
    .padding(.horizontal)
      .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly
  }
  
}


private extension SearchBarView {
  struct Constants {
    static let placeholder = "Search"
  }
}

extension UIApplication {
  func endEditing(_ force: Bool) {
    self.windows
      .filter{$0.isKeyWindow}
      .first?
      .endEditing(force)
  }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
  var gesture = DragGesture().onChanged{_ in
    UIApplication.shared.endEditing(true)
  }
  func body(content: Content) -> some View {
    content.gesture(gesture)
  }
}

extension View {
  func resignKeyboardOnDragGesture() -> some View {
    return modifier(ResignKeyboardOnDragGesture())
  }
}

#if DEBUG
struct SearchBarView_Previews: PreviewProvider {
  @State static var searchText = "Search"
  static var previews: some View {
    SearchBarView(searchText: $searchText)
  }
}
#endif
