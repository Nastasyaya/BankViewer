//
//  BankViewerApp.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 06.08.2025.
//

import SwiftUI

@main
struct BankViewerApp: App {
    init() {
        DIAssembler.assemble()
    }

    var body: some Scene {
        WindowGroup {
            AccountsListFlow(
                dependencies: AccountsListFlow.Dependencies(
                    accountsListViewBuilder: { onTransactionsTap in
                        let parameters = AccountListViewModel.Parameters(
                            onTransactionstapped: onTransactionsTap
                        )
                        let view = DIContainer.shared.resolve(
                            identifier: AccountListView.self,
                            parameters: parameters
                        )

                        return view
                    },
                    transactionsViewBuilder: { accountID, onBackTap in
                        EmptyView()
                    }
                )
            )
        }
    }
}
