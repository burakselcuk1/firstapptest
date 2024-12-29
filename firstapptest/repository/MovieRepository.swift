//
//  MovieRepository.swift
//  firstapptest
//
//  Created by Burak Selçuk on 29.12.2024.
//
import Foundation
import SwiftUI

class MovieRepository: MovieRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchPopularMovies() async throws -> [Movie] {
        let response: MovieResponse = try await networkService.fetch(from: "/movie/popular")
        return response.results
    }
}
