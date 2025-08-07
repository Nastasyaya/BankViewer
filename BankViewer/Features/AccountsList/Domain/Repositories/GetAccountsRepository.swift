//
//  GetAccountsRepository.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

import Combine

protocol GetAccountsRepository {
    func getAccounts(
        page: Int,
        size: Int,
        filter: String?
    ) -> AnyPublisher<AccountsListResponse, Error>
}
