import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationView {
            MovieListView(viewModel: viewModel)
                .navigationTitle("Popular Movies")
        }
        .onAppear {
            viewModel.fetchMovies()
        }
    }
}


struct MovieListView: View {
    @ObservedObject var viewModel: MovieViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error {
                VStack {
                    Text("Error loading movies")
                    Text(error.localizedDescription)
                        .font(.caption)
                        .foregroundColor(.red)
                    Button("Retry") {
                        viewModel.fetchMovies()
                    }
                }
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.movies) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                MovieCell(movie: movie)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct MovieCell: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            AsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            .cornerRadius(8)
            
            Text(movie.title)
                .font(.caption)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.top, 4)
        }
    }
}

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(movie.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", movie.voteAverage))
                        Spacer()
                        Text(movie.releaseDate)
                            .foregroundColor(.gray)
                    }
                    
                    Text("Overview")
                        .font(.headline)
                        .padding(.top)
                    
                    Text(movie.overview)
                        .font(.body)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    ContentView()
}
