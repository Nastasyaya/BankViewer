//
//  TransactionsResponse.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

struct TransactionsResponse: Hashable {
    let totalPages: Int
    let transactions: [Transaction]
}
