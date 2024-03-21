//
//  MoviesViewModelProtocol.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation

protocol MoviesViewModelProtocol: ObservableObject {
    var moviesState: ServiceState { get set }
    var movieDetailState: ServiceState { get set }
    init(moviesFetcher: MovieFetchable)
    func fetchMovies()
    func fetchMovieDetails(_ id: String)
}
