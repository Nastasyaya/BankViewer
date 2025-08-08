//
//  TransactionsContentConverter.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

import Foundation

protocol TransactionsContentConverter {
    func convert(domainModel: TransactionsResponse) -> TransactionsViewModel.Content
}

struct TransactionsContentConverterImp: TransactionsContentConverter {
    func convert(domainModel: TransactionsResponse) -> TransactionsViewModel.Content {
        let sortedData = domainModel.transactions.sorted {
            $0.processingDate < $1.processingDate
        }

        let chartData = sortedData.map { Int($0.amountValue) }

        return TransactionsViewModel.Content(
            chart: TransactionCardViewModel(
                title: "Transakce",
                subtitle: "Za měsíc",
                chartData: ChartViewModel(
                    data: chartData
                )
            ),
            items: convert(domainModel: domainModel)
        )
    }
    
    private func convert(domainModel: TransactionsResponse) -> [AccountCardViewModel] {
        domainModel.transactions.map { transaction in
            let id = UUID()

            return AccountCardViewModel(
                type: .transaction,
                accountID: "\(id)",
                name: transaction.typeDescription,
                description: transaction.senderName,
                balance: "\(transaction.amountValue)",
                currency: transaction.currency,
                onTap: { _ in }
            )
        }
    }
}
