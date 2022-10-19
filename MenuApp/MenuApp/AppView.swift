//
//  AppView.swift
//  MenuApp
//
//  Created by Samiksha Toshniwal on 19/10/22.
//

import Foundation
import SwiftUI

struct AppView: View {
  @StateObject var viewModel = AppViewModel()
  @State var showingAlert: Bool = false
  @State private var item = ""
  
  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.universities, id: \.self) { university in
          HStack {
            ImageContentView()
            Text(university.name)
              .bold()
            Spacer()
          }
          .onTapGesture {
            self.item = university.name
            showingAlert = true
          }
        }
        .alert(isPresented: $showingAlert) {
          Alert(title: Text(""), message: Text(item), dismissButton: .default(Text("Ok")))
        }
      }
      .navigationTitle("Universities")
      .onAppear {
        viewModel.fetchData()
      }
    }
  }
}
