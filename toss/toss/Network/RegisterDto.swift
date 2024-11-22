//
//  LoginDto.swift
//  Toss
//
//  Created by 어진 on 11/8/24.
//

import Foundation
/// 유저 등록 API
/// 각 프로퍼티는 8자 이하여야 함
struct LoginRequest: Codable {
  let username: String
  let password: String
  let hobby: String
}
