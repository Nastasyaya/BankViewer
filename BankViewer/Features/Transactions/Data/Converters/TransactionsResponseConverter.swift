//
//  TransactionsResponseConverter.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

protocol TransactionsResponseConverter {
    func convert(dto: TransactionsResponseDTO) -> TransactionsResponse
}

struct TransactionsResponseConverterImp: TransactionsResponseConverter {
    private let dateConverter: DateConverter
    
    init(dateConverter: DateConverter) {
        self.dateConverter = dateConverter
    }

    func convert(dto: TransactionsResponseDTO) -> TransactionsResponse {
        TransactionsResponse(
            totalPages: dto.pageCount,
            transactions: convert(dto: dto)
        )
    }
    
    private func convert(dto: TransactionsResponseDTO) -> [Transaction] {
        dto.transactions.map { transaction in
            Transaction(
                amountValue: transaction.amount.value,
                currency: transaction.amount.currency,
                processingDate: dateConverter.convert(from: transaction.processingDate) ?? .now,
                senderName: transaction.sender.name ?? "Some Name",
                recieverAccountNumber: transaction.receiver.accountNumber,
                typeDescription: transaction.typeDescription
            )
        }
    }
}
