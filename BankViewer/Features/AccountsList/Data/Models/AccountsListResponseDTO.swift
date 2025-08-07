//
//  AccountsListResponse.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

struct AccountsListResponseDTO: Decodable {
    let pageNumber: Int
    let pageCount: Int
    let pageSize: Int
    let recordCount: Int
    let nextPage: Int
    let accounts: [AccountDTO]
}
