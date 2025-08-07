//
//  GetAccountsUseCase.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

import Combine

protocol GetAccountsUseCase {
    func callAsFunction(
        page: Int,
        size: Int,
        filter: String?
    ) -> AnyPublisher<AccountsListResponse, Error>
}

final class GetAccountsLiveUseCase: GetAccountsUseCase {
    private let repository: GetAccountsRepository
    
    init(repository: GetAccountsRepository) {
        self.repository = repository
    }

    func callAsFunction(
        page: Int,
        size: Int,
        filter: String?
    ) -> AnyPublisher<AccountsListResponse, Error> {
        repository
            .getAccounts(page: page, size: size, filter: filter)
            .eraseToAnyPublisher()
    }
}
