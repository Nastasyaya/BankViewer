//
//  Path.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 06.08.2025.
//

enum Path {
    case allAccounts
    case detailOfSpecificAccount(_ accountID: String)
    case transactionsForSpecificAccount(_ accountID: String)
    
    var url: String {
        switch self {
        case .allAccounts:
            return "transparentAccounts"
        case let .detailOfSpecificAccount(accountID):
            return "transparentAccounts/\(accountID)"
        case let .transactionsForSpecificAccount(accountID):
            return "transparentAccounts/\(accountID)/transactions"
        }
    }
}
