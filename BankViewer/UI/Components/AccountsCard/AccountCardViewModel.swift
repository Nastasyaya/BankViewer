//
//  AccountCardViewModel.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

struct AccountCardViewModel {
    enum ContentType {
        case account
        case transaction
    }

    let type: ContentType
    let accountID: String
    let name: String
    let description: String?
    let balance: String
    let currency: String
    let onTap: (_ accountID: String) -> Void
    
    init(
        type: ContentType = .account,
        accountID: String = "",
        name: String,
        description: String?,
        balance: String,
        currency: String,
        onTap: @escaping (_ accountID: String) -> Void
    ) {
        self.type = type
        self.accountID = accountID
        self.name = name
        self.description = description
        self.balance = balance
        self.currency = currency
        self.onTap = onTap
    }
}
