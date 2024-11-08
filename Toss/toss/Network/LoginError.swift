////
////  LoginError.swift
////  Toss
////
////  Created by 어진 on 11/8/24.
////
//
//import Foundation
//
//enum LoginError: Error {
//    case bodyInvalid
//    case loginInvalid
//    case passwordInvalid
//    case wrongPath
//    case decodingError
//    case networkError(Error)
//    case unknown
//
//    var errorMessage: String {
//        switch self {
//        case .bodyInvalid:
//            return "잘못된 요청 본문입니다"
//        case .loginInvalid:
//            return "로그인 정보가 유효하지 않습니다"
//        case .passwordInvalid:
//            return "잘못된 비밀번호입니다"
//        case .wrongPath:
//            return "잘못된 경로입니다"
//        case .decodingError:
//            return "데이터 디코딩 실패"
//        case .networkError(let error):
//            return "네트워크 오류: \(error.localizedDescription)"
//        case .unknown:
//            return "알 수 없는 오류가 발생했습니다"
//        }
//    }
//}
//
//struct LoginErrorResponse: Decodable {
//    let code: String
//}
