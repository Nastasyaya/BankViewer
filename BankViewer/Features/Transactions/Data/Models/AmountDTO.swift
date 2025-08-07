//
//  AmountDTO.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

struct AmountDTO: Decodable {
    let value: Double
    let precision: Int
    let currency: String
}
