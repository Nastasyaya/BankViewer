//
//  TransactionsResponseDTO.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

struct TransactionsResponseDTO: Decodable {
    let pageNumber: Int
    let pageSize: Int
    let pageCount: Int
    let nextPage: Int
    let recordCount: Int
    let transactions: [TransactionDTO]
}
