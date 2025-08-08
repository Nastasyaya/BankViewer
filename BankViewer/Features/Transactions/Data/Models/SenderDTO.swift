//
//  SenderDTO.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

struct SenderDTO: Decodable {
    let accountNumber: String?
    let bankCode: String?
    let iban: String?
    let specificSymbol: String?
    let specificSymbolParty: String?
    let variableSymbol: String?
    let constantSymbol: String?
    let name: String?
    let description: String?
}
