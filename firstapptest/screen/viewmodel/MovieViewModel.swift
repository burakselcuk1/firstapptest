//
//  MovieViewModel.swift
//  firstapptest
//
//  Created by Burak Selçuk on 29.12.2024.
//

import Foundation
import SwiftUI

@MainActor
class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private let repository: MovieRepositoryProtocol
    
    init(repository: MovieRepositoryProtocol = MovieRepository()) {
        self.repository = repository
    }
    
    func fetchMovies() {
        Task {
            isLoading = true
            defer { isLoading = false }
            
            do {
                movies = try await repository.fetchPopularMovies()
            } catch {
                self.error = error
            }
        }
    }
}
