//
//  TransactionsContentConverter.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

protocol TransactionsContentConverter {
    func convert(domainModel: TransactionsResponse) -> TransactionsViewModel.Content
}

struct TransactionsContentConverterImp: TransactionsContentConverter {
    func convert(domainModel: TransactionsResponse) -> TransactionsViewModel.Content {
        TransactionsViewModel.Content(
            totalPages: domainModel.totalPages,
            items: domainModel.transactions.map { transaction in
                TransactionCardViewModel(
                    amountValue: transaction.amountValue,
                    currency: transaction.currency,
                    processingDate: transaction.processingDate,
                    senderName: transaction.senderName,
                    recieverAccountNumber: transaction.recieverAccountNumber,
                    typeDescription: transaction.typeDescription
                )
            }
        )
    }
}
