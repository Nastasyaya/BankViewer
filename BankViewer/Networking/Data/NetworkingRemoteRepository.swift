//
//  NetworkingRemoteRepository.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 06.08.2025.
//

import Combine
import SwiftUI

final class NetworkingRemoteRepository: NetworkingRepository {
    static let shared = NetworkingRemoteRepository()

    private init() {}

    func run<R: Decodable>(endpoint: Endpoint) -> AnyPublisher<R, NetworkError> {
        guard let request = makeURLRequest(from: endpoint) else {
            return Fail(error: .network(.badURL))
                .eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200
                else {
                    throw NetworkError.network(.badServerResponse)
                }
                print(response.statusCode)
                print(response.url?.absoluteString ?? "🐦‍🔥 Incorrect url")
                print(data.prettyPrintedJSONString ?? "🔥 Incorrect data")

                return data
            }
            .decode(type: R.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                if let error = error as? URLError {
                    print(error)
                    return .network(error.code)
                } else if let error = error as? DecodingError {
                    print(error)
                    return .decoding(error)
                } else {
                    return .unknown
                }
            }
            .eraseToAnyPublisher()
    }

    // MARK: - MAKE REQUEST
    private func makeURLRequest(from endpoint: Endpoint) -> URLRequest? {
        guard let url = makeURL(from: endpoint) else {
            return nil
        }

        var request = URLRequest(url: url)

        request.httpMethod = endpoint.httpMethod.rawValue
        request.timeoutInterval = 10

        for (headerField, headerValue) in endpoint.headers {
            request.setValue(headerValue, forHTTPHeaderField: headerField)
        }

        return request
    }

    // MARK: - MAKE URL
    private func makeURL(from endpoint: Endpoint) -> URL? {
        var components = URLComponents()

        components.scheme = "https"
        components.host = "webapi.developers.erstegroup.com"
        components.path = "/api/csas/public/sandbox/v3/\(endpoint.path.url)"
        components.queryItems = endpoint.queryItems

        print("➡️ URL:", components.url?.absoluteString ?? "nil")
        return components.url
    }
}
