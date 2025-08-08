//
//  DIAssembler+AccountsList.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

extension DIAssembler {
    static func assembleAccountsListFeature() {
        DIContainer.shared.register(identifier: AccountListView.self) { parameters in
            guard let parameters = parameters as? AccountListViewModel.Parameters else {
                fatalError("Missing parameters for AccountListView")
            }

            let contentConverter = AccountListContentConverterImp()
            let responseConverter = AccountsListResponseConverterImp()

            let repository = GetAccountsRemoteRepository(
                networkRepository: DIContainer.shared.resolve(identifier: NetworkingRepository.self),
                converter: responseConverter
            )
            let getAccountsUseCase = GetAccountsLiveUseCase(
                repository: repository
            )

            let viewModel = AccountListViewModel(
                dependencies: AccountListViewModel.Dependencies(
                    contentConverter: contentConverter,
                    getAccountsUseCase: getAccountsUseCase
                ),
                parameters: parameters
            )

            return AccountListView(viewModel: viewModel)
        }
    }
}
