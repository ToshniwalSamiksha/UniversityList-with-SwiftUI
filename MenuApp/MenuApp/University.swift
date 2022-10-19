//
//  University.swift
//  MenuApp
//
//  Created by Samiksha Toshniwal on 19/10/22.
//

import Foundation

struct University: Hashable, Codable {
  let domains: [String]
  let country: String
  let stateProvince: String?
  let webPages: [String]
  let name: String
  let alphaTwoCode: String

  private enum CodingKeys : String, CodingKey {
    case domains
    case country
    case stateProvince = "state-province"
    case webPages = "web_pages"
    case name
    case alphaTwoCode = "alpha_two_code"
  }
}
