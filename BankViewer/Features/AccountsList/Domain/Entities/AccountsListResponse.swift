//
//  AccountsListResponse.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

struct AccountsListResponse: Hashable {
    let totalPages: Int
    let accounts: [Account]
}
