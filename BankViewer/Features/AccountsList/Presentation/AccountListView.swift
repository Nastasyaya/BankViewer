//
//  AccountListView.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

import SwiftUI

struct AccountListView: View {
    @StateObject var viewModel: AccountListViewModel

    var body: some View {
        ScrollView {
            Group {
                switch viewModel.state {
                case let .content(content):
                    makeMainContent(content: content)
                case .loading:
                    loadingView
                case .error:
                    errorView
                }
            }
        }
        .scrollIndicators(.hidden)
        .refreshable {
            viewModel.onRefresh()
        }
        .background {
            Color.customBackground.ignoresSafeArea()
        }
    }

    private var loadingView: some View {
        ProgressView()
    }
    
    private var errorView: some View {
        Text("Something going wrong, please refresh the screen")
            .font(.title)
            .lineLimit(2)
    }

    private func makeMainContent(content: AccountListViewModel.Content) -> some View {
        LazyVStack {
            ForEach(content.items, id: \.accountID) { account in
                AccountCardView(viewModel: account)
                    .onAppear {
                        viewModel.loadNextPage(accountID: account.accountID)
                    }
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .frame(height: 100)
            }
        }
        .padding(
            EdgeInsets(
                top: 16,
                leading: 16,
                bottom: 40,
                trailing: 16
            )
        )
    }
}
