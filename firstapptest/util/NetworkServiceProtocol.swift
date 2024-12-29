//
//  NetworkServiceProtocol.swift
//  firstapptest
//
//  Created by Burak Selçuk on 29.12.2024.
//

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(from endpoint: String) async throws -> T
}
