//
//  NetworkError.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 06.08.2025.
//

import Foundation

enum NetworkError: Error {
    case network(URLError.Code)
    case decoding(Error)
    case unknown
}
