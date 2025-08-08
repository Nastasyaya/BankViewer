//
//  AccountListContentConverter.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

protocol AccountListContentConverter {
    func convert(
        domainModel: AccountsListResponse,
        onCardTapped: @escaping (_ accountID: String) -> Void
    ) -> AccountListViewModel.Content
}

struct AccountListContentConverterImp: AccountListContentConverter {
    func convert(
        domainModel: AccountsListResponse,
        onCardTapped: @escaping (_ accountID: String) -> Void
    ) -> AccountListViewModel.Content {
        AccountListViewModel.Content(
            totalPages: domainModel.totalPages,
            items: domainModel.accounts.map { account in
                AccountCardViewModel(
                    accountID: account.accountID,
                    name: account.name,
                    description: account.description,
                    balance: "\(account.balance)",
                    currency: account.currency,
                    onTap: { accountID in
                        onCardTapped(accountID)
                    }
                )
            }
        )
    }
}
