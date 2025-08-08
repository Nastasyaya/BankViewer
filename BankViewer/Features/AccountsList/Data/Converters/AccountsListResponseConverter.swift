//
//  AccountsListResponseConverter.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

protocol AccountsListResponseConverter {
    func convert(dto: AccountsListResponseDTO) -> AccountsListResponse
}

struct AccountsListResponseConverterImp: AccountsListResponseConverter {
    func convert(dto: AccountsListResponseDTO) -> AccountsListResponse {
        AccountsListResponse(
            totalPages: dto.pageCount,
            accounts: convert(dto: dto)
        )
    }
    
    private func convert(dto: AccountsListResponseDTO) -> [Account] {
        dto.accounts.map { account in
            Account(
                accountID: account.accountNumber,
                name: account.name ?? "unknown",
                balance: account.balance ?? 0,
                currency: account.currency ?? "czk",
                description: account.description ?? nil
            )
        }
    }
}
