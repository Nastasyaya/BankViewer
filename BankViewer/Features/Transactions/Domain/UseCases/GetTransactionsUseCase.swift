//
//  GetTransactionsUseCase.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

import Combine

protocol GetTransactionsUseCase {
    func callAsFunction(
        query: TransactionQuery
    ) -> AnyPublisher<TransactionsResponse, Error>
}

final class GetTransactionsLiveUseCase: GetTransactionsUseCase {
    private let repository: GetTransactionsRepository
    
    init(repository: GetTransactionsRepository) {
        self.repository = repository
    }
    
    func callAsFunction(
        query: TransactionQuery
    ) -> AnyPublisher<TransactionsResponse, Error> {
        repository.getTransactions(query: query)
            .eraseToAnyPublisher()
    }
}
