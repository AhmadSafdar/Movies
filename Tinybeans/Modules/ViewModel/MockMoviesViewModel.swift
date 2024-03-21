//
//  MockMoviesViewModel.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/21/24.
//

import Foundation

class MockMoviesViewModel: MoviesViewModelProtocol {
    @Published var moviesState: ServiceState
    
    @Published var movieDetailState: ServiceState
    
    required init(moviesFetcher: MovieFetchable) {
        moviesState = .loaded(Movies.mockData())
        movieDetailState = .loaded(MovieDetail.mockData())
    }
    
    func fetchMovies() {}
    
    func fetchMovieDetails(_ id: String) {}
    
    
}
