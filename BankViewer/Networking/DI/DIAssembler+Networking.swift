//
//  Untitled.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

extension DIAssembler {
    static func assembleNetworking() {
        DIContainer.shared.register(identifier: NetworkingRepository.self) {
            NetworkingRemoteRepository.shared
        }
    }
}
