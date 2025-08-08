//
//  TransactionCardView.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

import SwiftUI

struct TransactionCardView: View {
    let viewModel: AccountCardViewModel

    var body: some View {
        Button {
            viewModel.onTap(viewModel.accountID)
        } label: {
            buttonLabel
        }
    }

    private var buttonLabel: some View {
        HStack(spacing: .zero) {
            titleSection

            Spacer()

            currencySection
        }
        .padding()
        .background {
            background
        }
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(.customBackground)
            .shadow(color: .black, radius: 0.4)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(viewModel.name)
                .font(.headline)
                .foregroundStyle(.black)
                .lineLimit(3)
            
            if let description = viewModel.description {
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.customSecondary)
                    .lineLimit(1)
                    .padding(.top)
            }
        }
        .multilineTextAlignment(.leading)
    }
    
    private var currencySection: some View {
        HStack(spacing: .zero) {
            Text(viewModel.balance)
                .font(.caption)
                .foregroundStyle(.black)
                .padding(.trailing, 6)
            
            Text(viewModel.currency.uppercased())
                .font(.caption)
                .foregroundStyle(.black)
                .padding(.trailing, 8)
            
            Image(systemName: "chevron.right")
                .frame(height: 8)
                .foregroundStyle(.black)
        }
        .multilineTextAlignment(.trailing)
    }
}

