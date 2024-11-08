//
//  UserService.swift
//  Toss
//
//  Created by 어진 on 11/2/24.
//

import Foundation
import Alamofire

class UserService {
    
    /// 회원가입 메서드
    func register(
        username: String,
        password: String,
        hobby: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        let url = Environment.baseURL + "/user"
        let parameters = RegisterRequest(username: username, password: password, hobby: hobby)
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { [weak self] response in
            guard let self = self,
                  let statusCode = response.response?.statusCode,
                  let data = response.data else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                completion(.success(true))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .invalidRequest
        case (400, "01"):
            return .expressionError
        case (404, ""):
            return .invalidURL
        case (409, "00"):
            return .duplicateError
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
    
    /// 에러 코드 디코딩 함수
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {
            return ""
        }
        return errorResponse.code
    }
}
