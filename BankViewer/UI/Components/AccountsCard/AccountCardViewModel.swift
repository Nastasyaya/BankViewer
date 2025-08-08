//
//  AccountCardViewModel.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

struct AccountCardViewModel {
    let accountID: String
    let name: String
    let description: String?
    let balance: String
    let currency: String
    let onTap: (_ accountID: String) -> Void
}
