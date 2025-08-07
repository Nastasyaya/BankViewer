//
//  Endpoint.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 06.08.2025.
//

import Foundation

protocol Endpoint {
    var httpMethod: HTTPMethod { get }
    var path: Path { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem] { get }
    var requestBody: Data? { get }
}

extension Endpoint {
    var queryItems: [URLQueryItem] { [] }
    var requestBody: Data? { nil }
    
    var headers: [String: String] {
        return [
//            "Accept": "application/json",
            "WEB-API-key": APIKey.key
        ]
    }
}
