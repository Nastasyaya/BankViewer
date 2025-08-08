//
//  TransactionCardView.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

import SwiftUI

struct TransactionCardView: View {
    let viewModel: TransactionCardViewModel

    var body: some View {
        makeContent()
    }

    private func makeContent() -> some View {
        VStack(spacing: .zero) {
            Text(viewModel.title)
                .font(.headline)
                .foregroundStyle(.customPrimary)
            
            ChartView(viewModel: viewModel.chartData)
                .padding(.vertical, 20)
            
            Text(viewModel.subtitle)
                .font(.caption)
                .foregroundStyle(.customSecondary)
        }
        .multilineTextAlignment(.center)
    }
}

