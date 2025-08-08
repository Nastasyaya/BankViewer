//
//  DIAssembler+Transactions.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

extension DIAssembler {
    static func assembleTransactionsFeature() {
        DIContainer.shared.register(identifier: TransactionsView.self) { parameters in
            guard let parameters = parameters as? TransactionsViewModel.Parameters else {
                fatalError("Missing parameters for AccountListView")
            }

            let contentConverter = TransactionsContentConverterImp()
            let dateConverter = DateConverterImp()
            let responseConverter = TransactionsResponseConverterImp(
                dateConverter: dateConverter
            )

            let repository = GetTransactionsRemoteRepository(
                networkRepository: DIContainer.shared.resolve(identifier: NetworkingRepository.self),
                converter: responseConverter
            )
            let getTransactionsUseCase = GetTransactionsLiveUseCase(
                repository: repository
            )

            let viewModel = TransactionsViewModel(
                dependencies: TransactionsViewModel.Dependencies(
                    contentConverter: contentConverter,
                    getTransactionsUseCase: getTransactionsUseCase
                ),
                parameters: parameters
            )

            return TransactionsView(viewModel: viewModel)
        }
    }
}
