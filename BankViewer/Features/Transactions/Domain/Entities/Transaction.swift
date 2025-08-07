//
//  Transaction.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

import Foundation

struct Transaction: Hashable {
    let amountValue: Double
    let currency: String
    let processingDate: Date
    let senderName: String
    let recieverAccountNumber: String
    let typeDescription: String
}
