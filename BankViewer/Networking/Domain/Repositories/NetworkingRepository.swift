//
//  NetworkingRepository.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 06.08.2025.
//

import Combine

protocol NetworkingRepository {
    func run<R: Decodable>(endpoint: Endpoint) -> AnyPublisher<R, NetworkError>
}
