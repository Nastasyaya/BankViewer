//
//  GetAccountsRemoteRepository.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

import Combine

final class GetAccountsRemoteRepository {
    private let networkRepository: NetworkingRepository
    private let converter: AccountsListResponseConverter

    init(
        networkRepository: NetworkingRepository,
        converter: AccountsListResponseConverter
    ) {
        self.networkRepository = networkRepository
        self.converter = converter
    }
}

extension GetAccountsRemoteRepository: GetAccountsRepository {
    func getAccounts(
        page: Int,
        size: Int,
        filter: String?
    ) -> AnyPublisher<AccountsListResponse, Error> {
        networkRepository
            .run(endpoint: AccountsListEndpoint(page: page, size: size, filter: filter))
            .map { dto in
                self.converter.convert(dto: dto)
            }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
