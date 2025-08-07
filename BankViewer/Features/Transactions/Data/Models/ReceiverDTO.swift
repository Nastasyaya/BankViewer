//
//  ReceiverDTO.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

struct ReceiverDTO: Decodable {
    let accountNumber: String
    let bankCode: String
    let iban: String
}
