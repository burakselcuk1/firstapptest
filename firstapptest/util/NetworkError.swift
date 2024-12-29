//
//  NetworkError.swift
//  firstapptest
//
//  Created by Burak Selçuk on 29.12.2024.
//

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingError
}
