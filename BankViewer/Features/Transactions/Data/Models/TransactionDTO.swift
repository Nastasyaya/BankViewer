//
//  TransactionDTO.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

struct TransactionDTO: Decodable {
    let amount: AmountDTO
    let type: String
    let dueDate: String
    let processingDate: String
    let sender: SenderDTO
    let receiver: ReceiverDTO
    let typeDescription: String
}
