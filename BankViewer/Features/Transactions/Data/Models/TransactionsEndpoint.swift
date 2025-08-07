//
//  TransactionsEndpoint.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

import Foundation

struct TransactionsListEndpoint: Endpoint {
    let accountId: String
    let page: Int
    let size: Int
    let sort: String?
    let order: String?
    let dateFrom: String?
    let dateTo: String?
    let filter: String?

    let httpMethod: HTTPMethod = .get

    var path: Path {
        .transactionsForSpecificAccount(accountId)
    }

    var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "size", value: "\(size)"),
        ]
        
        if let sort = sort {
            items.append(URLQueryItem(name: "sort", value: sort))
        }

        if let order = order {
            items.append(URLQueryItem(name: "order", value: order))
        }

        if let dateFrom = dateFrom {
            items.append(URLQueryItem(name: "dateFrom", value: dateFrom))
        }

        if let dateTo = dateTo {
            items.append(URLQueryItem(name: "dateTo", value: dateTo))
        }

        if let filter = filter {
            items.append(URLQueryItem(name: "filter", value: filter))
        }

        return items
    }
}
