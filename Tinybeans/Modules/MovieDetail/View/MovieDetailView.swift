//
//  MovieDetailView.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import SwiftUI

struct MovieDetailView<Model>: View where Model:MoviesViewModelProtocol {
    
    @ObservedObject private var viewModel: Model
    let movie: Movie
    
    init (viewModel: Model, movie: Movie) {
        self.viewModel = viewModel
        self.movie = movie
    }
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                switch viewModel.movieDetailState {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView()
                case .failed(let error):
                    ErrorView(error: error)
                case . loaded(let detail):
                    if let detail = detail as? MovieDetail {
                        VStack(spacing: 10) {
                            HStack {
                                MovieImage(source: detail.posterPath)
                                    .frame(height: AppConstants.Movies.ImageHeight)
                                Spacer()
                                VStack(spacing: 8) {
                                    Text(detail.title).font(.title).padding()
                                    Text(detail.releaseDate)
                                    Spacer()
                                }
                                .h3TitleStyle()
                            }
                            Divider()
                            Text(detail.overview).padding()
                            Spacer()
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .navigationBarTitle(AppConstants.PageTitle.MovieDetailView)
        .task {
            viewModel.fetchMovieDetails(String(movie.id))
        }
    }
    
    @ViewBuilder
    func show(title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title + ":")
                .h3TitleStyle()
            Text(description)
                .descriptionStyle()
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MockMoviesViewModel(moviesFetcher: MockMovieService()), movie: Movie.mockData())
    }
}
