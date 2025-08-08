//
//  AccountListViewModel.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

import Combine
import Foundation

final class AccountListViewModel: ObservableObject {
    enum State {
        case content(Content)
        case error
        case loading
    }

    struct Content {
        let totalPages: Int
        let items: [AccountCardViewModel]
    }
    
    struct Parameters {
        let onTransactionstapped: (_ accountID: String) -> Void
    }

    struct Dependencies {
        let contentConverter: AccountListContentConverter
        let getAccountsUseCase: GetAccountsUseCase
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
        
        getAccounts()
    }
    
    func loadNextPage(accountID: String) {
        guard canLoadNextPage(accountID: accountID) else { return }
        
        isLoading = true

        currentPage += 1

        getAccounts()
        
        isLoading = false
    }
    
    func onRefresh() {
        currentPage = 0
        
        getAccounts()
    }
}

// MARK: - GetAccounts
private extension AccountListViewModel {
    func getAccounts() {
        dependencies.getAccountsUseCase(
            page: currentPage,
            size: 50,
            filter: nil
        )
        .compactMap { [weak self] response in
            self?.totalPages = response.totalPages

            let newItems = self?.dependencies.contentConverter.convert(
                domainModel: response,
                onCardTapped: { [weak self] accountID in
                    self?.parameters.onTransactionstapped(accountID)
                }
            )

            let existingItems: [AccountCardViewModel]

            if case let .content(content) = self?.state {
                existingItems = content.items
            } else {
                existingItems = []
            }

            let combinedItems: [AccountCardViewModel]

            if let new = newItems?.items {
                combinedItems = existingItems + new
            } else {
                combinedItems = existingItems
            }

            return Content(totalPages: response.totalPages, items: combinedItems)
        }
        .map { .content($0) }
        .replaceError(with: .error)
        .receive(on: DispatchQueue.main)
        .assign(to: &$state)
    }
}

// MARK: - Pagination
private extension AccountListViewModel {
    func canLoadNextPage(accountID: String) -> Bool {
        guard case .content = state,
              isLast(accountID: accountID),
              !isLoading,
              currentPage < totalPages else { return false }

        return true
    }

    func isLast(accountID: String) -> Bool {
        guard case let .content(content) = state else { return false }
        return content.items.last?.accountID == accountID
    }
}
