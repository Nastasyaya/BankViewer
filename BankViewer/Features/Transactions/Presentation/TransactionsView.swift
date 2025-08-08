//
//  TransactionsView.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

import SwiftUI

struct TransactionsView: View {
    @StateObject var viewModel: TransactionsViewModel

    var body: some View {
        ScrollView {
            Group {
                switch viewModel.state {
                case let .content(content):
                    makeContent(from: content)
                case .error:
                    errorView
                case .loading:
                    loadingView
                }
            }
        }
        .scrollIndicators(.hidden)
        .refreshable {
            viewModel.onRefresh()
        }
    }

    private var loadingView: some View {
        ProgressView()
    }

    private var errorView: some View {
        ZStack {
            Text("Something going wrong, please refresh the screen")
                .font(.title)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .background {
            Color.customBackground.ignoresSafeArea()
        }
    }

    private func makeContent(from content: TransactionsViewModel.Content) -> some View {
        LazyVStack(pinnedViews: [.sectionHeaders]) {
            Section {
                TransactionCardView(viewModel: content.chart)
                    .frame(height: 200)
            }

            Section {
                ForEach(content.items, id: \.accountID) { item in
                    AccountCardView(viewModel: item)
                }
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
