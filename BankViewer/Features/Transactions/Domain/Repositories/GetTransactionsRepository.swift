//
//  GetTransactionsRepository.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

import Combine

protocol GetTransactionsRepository {
    func getTransactions(query: TransactionQuery) -> AnyPublisher<TransactionsResponse, Error>
}
