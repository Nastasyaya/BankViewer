//
//  TransactionsViewModel.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

import Combine
import Foundation

final class TransactionsViewModel: ObservableObject {
    enum State {
        case content(Content)
        case error
        case loading
    }

    struct Content {
        let totalPages: Int
        let chart: TransactionCardViewModel
        let items: [AccountCardViewModel]
    }
    
    struct Parameters {
        let accountID: String
        let onBack: () -> Void
    }

    struct Dependencies {
        let contentConverter: TransactionsContentConverter
        let getTransactionsUseCase: GetTransactionsUseCase
    }

    @Published private(set) var state: State = .loading

    var isLoading = false

    private var currentPage = 0
    private var totalPages = 0

    private let dependencies: Dependencies
    private let parameters: Parameters

    init(
        dependencies: Dependencies,
        parameters: Parameters
    ) {
        self.dependencies = dependencies
        self.parameters = parameters

        getTransactions()
    }

    func onRefresh() {
        currentPage = 0
        
        getTransactions()
    }
}

private extension TransactionsViewModel {
    func getTransactions() {
        dependencies.getTransactionsUseCase.callAsFunction(
            query: TransactionQuery(
                accountId: parameters.accountID,
                page: currentPage,
                size: 25,
                sort: nil,
                order: nil,
                dateFrom: nil,
                dateTo: nil,
                filter: nil
            )
        )
        .compactMap { [weak self] in
            self?.dependencies.contentConverter.convert(domainModel: $0)
        }
        .map { .content($0) }
        .replaceError(with: .error)
        .receive(on: DispatchQueue.main)
        .assign(to: &$state)
    }
}
