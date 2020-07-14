//
//  Some.swift
//  Fave
//
//  Created by Kola Emiola on 02/07/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import SwiftUI

struct Some: View { // your main view
  @State var showModal: Bool = false
  
  var body: some View {
    NavigationView {
      Button(action: {
        self.showModal.toggle()
      }) {
        HStack {
          Image(systemName: "plus.circle.fill")
            .imageScale(.large)
          Text("Show Modal")
        }
      }
      .navigationBarTitle("Welcome")
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .overlay(ModalView(showModal: $showModal))
  }
}

struct ModalView: View { // draws a semi-transparent rectangle that contains the modal
  @Binding var showModal: Bool
  
  var body: some View {
    Group {
      if showModal {
        Rectangle()
          .foregroundColor(Color.black.opacity(0.5))
          .edgesIgnoringSafeArea(.all)
          .overlay(
            GeometryReader { geometry in
              RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
                .frame(width: min(geometry.size.width - 100, 300), height: min(geometry.size.height - 100, 200))
                .overlay(ModalContentView(showModal: self.$showModal))
            }
        )
      }
    }
  }
}

struct ModalContentView: View { // the real modal content
  @Binding var showModal: Bool
  
  var body: some View {
    VStack {
      Text("Modal Content")
      
      Button(action: {
        self.showModal.toggle()
      }) {
        HStack {
          Image(systemName: "xmark.circle.fill")
            .imageScale(.large)
          Text("Close Modal")
        }
      }
    }
  }
}

struct Some_Previews: PreviewProvider {
    static var previews: some View {
        Some()
    }
}
