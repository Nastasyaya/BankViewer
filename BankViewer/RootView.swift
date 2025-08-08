//
//  RootView.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 06.08.2025.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        AccountListView(
            viewModel: AccountListViewModel(
                dependencies: AccountListViewModel.Dependencies(
                    contentConverter: AccountListContentConverterImp(),
                    getAccountsUseCase: GetAccountsLiveUseCase(
                        repository: GetAccountsRemoteRepository(
                            networkRepository: NetworkingRemoteRepository.shared,
                            converter: AccountsListResponseConverterImp()
                        )
                    )
                ),
                parameters: AccountListViewModel.Parameters(
                    onTransactionstapped: { _ in }
                )
            )
        )
    }
}
