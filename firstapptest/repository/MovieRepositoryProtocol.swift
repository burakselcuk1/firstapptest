import Foundation
import SwiftUI

protocol MovieRepositoryProtocol {
    func fetchPopularMovies() async throws -> [Movie]
} 