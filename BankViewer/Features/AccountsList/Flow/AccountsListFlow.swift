//
//  AccountsListFlow.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

import SwiftUI

struct AccountsListFlow: View {
    struct Dependencies {
        @ViewBuilder let accountsListViewBuilder: (
            _ onTransactionsTap: @escaping (_ accountID: String) -> Void
        ) -> AccountListView

        @ViewBuilder let transactionsViewBuilder: (
            _ accountID: String,
            _ onBackTap: @escaping () -> Void
        ) -> TransactionsView
    }

    private enum Destination: Hashable {
        case transactions(_ accountID: String)
    }

    @State private var path: [Destination] = []

    let dependencies: Dependencies

    var body: some View {
        NavigationStack(path: $path) {
            dependencies.accountsListViewBuilder { accountID in
                path.append(.transactions(accountID))
            }
            .navigationTitle("Účty")
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case let .transactions(accountID):
                    dependencies.transactionsViewBuilder(
                        accountID,
                        { path.removeLast() }
                    )
                }
            }
        }
    }
}
