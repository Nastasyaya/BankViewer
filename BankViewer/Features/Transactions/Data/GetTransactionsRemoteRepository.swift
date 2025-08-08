//
//  GetTransactionsRemoteRepository.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

import Combine

final class GetTransactionsRemoteRepository {
    private let networkRepository: NetworkingRepository
    private let converter: TransactionsResponseConverter

    init(
        networkRepository: NetworkingRepository,
        converter: TransactionsResponseConverter
    ) {
        self.networkRepository = networkRepository
        self.converter = converter
    }
}

extension GetTransactionsRemoteRepository: GetTransactionsRepository {
    func getTransactions(
        query: TransactionQuery
    ) -> AnyPublisher<TransactionsResponse, Error> {
        networkRepository
            .run(
                endpoint: TransactionsListEndpoint(
                    accountId: query.accountId,
                    page: query.page,
                    size: query.size,
                    sort: query.sort,
                    order: query.order,
                    dateFrom: query.dateFrom,
                    dateTo: query.dateTo,
                    filter: query.filter
                )
            )
            .map { dto in
                self.converter.convert(dto: dto)
            }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
