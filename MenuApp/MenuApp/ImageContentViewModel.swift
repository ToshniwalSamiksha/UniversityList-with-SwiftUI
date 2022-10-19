//
//  ImageContentViewModel.swift
//  MenuApp
//
//  Created by Samiksha Toshniwal on 19/10/22.
//

import Foundation

class ImageContentViewModel: ObservableObject {
  private enum NetworkPath {
    static let generic: String = "https://skilloutlook.com/wp-content/uploads/2017/02/Central-University-South-Vihar.jpg"
  }
  
  @Published var imageData: Data?

  func fetchImageData() {
    guard let url = URL(string: NetworkPath.generic) else { return }
    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
      DispatchQueue.main.async {
        self.imageData = data
      }
    }
    task.resume()
  }
}
