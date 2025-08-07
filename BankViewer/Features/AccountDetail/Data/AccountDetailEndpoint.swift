//
//  AccountDetailEndpoint.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

struct AccountDetailEndpoint: Endpoint {
    let id: String
    let httpMethod: HTTPMethod = .get
    
    var path: Path {
        .detailOfSpecificAccount(id)
    }
    
    static func create(id: String) -> Self {
        AccountDetailEndpoint(id: id)
    }
}
