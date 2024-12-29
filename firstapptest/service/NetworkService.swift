//
//  NetworkService.swift
//  firstapptest
//
//  Created by Burak Selçuk on 29.12.2024.
//
import Foundation
import SwiftUI
class NetworkService: NetworkServiceProtocol {
    private let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZWViMzlkNmRmMzk2YjMzNzNmMTg4MjA4MDM4MTEyYyIsIm5iZiI6MTY0MTM4NjIwMy4yNjcsInN1YiI6IjYxZDU5MGRiMzE2NDRiMDAxYzA0YTNjYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.49doIVhqDMKq9aV4TYp7COXfyP91D759OiFRwk46q30"
    private let baseURL = "https://api.themoviedb.org/3"
    
    func fetch<T: Decodable>(from endpoint: String) async throws -> T {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
