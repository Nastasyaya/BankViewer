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
        let items: [TransactionCardViewModel]
    }
    
    struct Parameters {
        let accountID: String
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
    private let onBack: () -> Void

    init(
        dependencies: Dependencies,
        parameters: Parameters,
        onBack: @escaping () -> Void
    ) {
        self.dependencies = dependencies
        self.parameters = parameters
        self.onBack = onBack
        
        getTransactions()
    }
    
//    func loadNextPage(accountID: String) {
//        guard canLoadNextPage(accountID: accountID) else { return }
//        
//        isLoading = true
//
//        currentPage += 1
//
//        getTransactions()
//
//        isLoading = false
//    }
    
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

//// MARK: - GetAccounts
//private extension AccountListViewModel {
//    func getAccounts() {
//        dependencies.getAccountsUseCase(
//            page: currentPage,
//            size: 50,
//            filter: nil
//        )
//        .compactMap { [weak self] response in
//            self?.totalPages = response.totalPages
//
//            let newItems = self?.dependencies.contentConverter.convert(
//                domainModel: response,
//                onCardTapped: { [weak self] accountID in
//                    self?.parameters.onTransactionstapped(accountID)
//                }
//            )
//
//            let existingItems: [AccountCardViewModel]
//
//            if case let .content(content) = self?.state {
//                existingItems = content.items
//            } else {
//                existingItems = []
//            }
//
//            let combinedItems: [AccountCardViewModel]
//
//            if let new = newItems?.items {
//                combinedItems = existingItems + new
//            } else {
//                combinedItems = existingItems
//            }
//
//            return Content(totalPages: response.totalPages, items: combinedItems)
//        }
//        .map { .content($0) }
//        .replaceError(with: .error)
//        .receive(on: DispatchQueue.main)
//        .assign(to: &$state)
//    }
//}
//
//// MARK: - Pagination
//private extension AccountListViewModel {
//    func canLoadNextPage(accountID: String) -> Bool {
//        guard case .content = state,
//              isLast(accountID: accountID),
//              !isLoading,
//              currentPage < totalPages else { return false }
//
//        return true
//    }
//
//    func isLast(accountID: String) -> Bool {
//        guard case let .content(content) = state else { return false }
//        return content.items.last?.accountID == accountID
//    }
//}
