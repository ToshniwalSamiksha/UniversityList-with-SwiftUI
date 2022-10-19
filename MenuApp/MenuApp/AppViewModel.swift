//
//  AppViewModel.swift
//  MenuApp
//
//  Created by Samiksha Toshniwal on 19/10/22.
//

import Foundation

class AppViewModel: ObservableObject {
  private enum NetworkPath {
    static let india: String = "http://universities.hipolabs.com/search?country=India"
  }
  
  @Published var universities: [University] = []

  func fetchData() {
    guard let url = URL(string: NetworkPath.india) else { return }
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
      guard let data = data, error == nil else {
        return
      }
      do {
        let universities = try JSONDecoder().decode([University].self, from: data)
        DispatchQueue.main.async {
          self?.universities = universities
        }
      } catch {
        print(error)
      }
    }
    task.resume()
  }
}
