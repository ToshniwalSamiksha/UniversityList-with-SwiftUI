//
//  ImageContentView.swift
//  MenuApp
//
//  Created by Samiksha Toshniwal on 19/10/22.
//

import Foundation
import SwiftUI

struct ImageContentView: View {
  @StateObject var imageContentViewModel = ImageContentViewModel()
  
  var body: some View {
    if let data = imageContentViewModel.imageData, let uiimage = UIImage(data: data) {
      Image(uiImage: uiimage)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 100, height: 70)
        .foregroundColor(Color.gray)
        .clipped()
    } else {
      Image(systemName: "iphone")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 100, height: 70)
        .foregroundColor(Color.gray)
        .onAppear {
          imageContentViewModel.fetchImageData()
        }
    }
  }
}
