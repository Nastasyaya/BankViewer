//
//  AccountsListEndpoint.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

import Foundation

struct AccountsListEndpoint: Endpoint {
    let page: Int
    let size: Int
    let filter: String?
    let httpMethod: HTTPMethod = .get
    let path: Path = .allAccounts
    
    var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "size", value: "\(size)")
        ]

        if let filter = filter {
            items.append(URLQueryItem(name: "filter", value: filter))
        }

        return items
    }
    
    static func create(page: Int, size: Int, filter: String?) -> Self {
        AccountsListEndpoint(page: page, size: size, filter: filter)
    }
}
