//
//  TransactionsQuery.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

struct TransactionQuery {
    let accountId: String
    let page: Int
    let size: Int
    let sort: String?
    let order: String?
    let dateFrom: String?
    let dateTo: String?
    let filter: String?
}
