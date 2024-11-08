//
//  Environment.swift
//  Toss
//
//  Created by 어진 on 11/2/24.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
