//
//  MoviesViewModel.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation
import Combine
import SwiftUI

class MoviesViewModel {
    @Published var moviesState: ServiceState
    @Published var movieDetailState: ServiceState
    private var currentPage: Int = 0
    private var canLoadMorePages = true
    private let movieFetchable: MovieFetchable
    private var movies: [Movie] = []
    private var disposables = Set<AnyCancellable>()

    required init(moviesFetcher: MovieFetchable) {
        self.movieFetchable = moviesFetcher
        self.moviesState = .idle
        self.movieDetailState = .idle
    }

}

//MARK: - MoviesViewModelProtocol Extension

extension MoviesViewModel: MoviesViewModelProtocol {
    
    func fetchMovies() {
        guard canLoadMorePages else {
            return
        }
        currentPage += 1
        movieFetchable
            .fetchPopularMovie(page: currentPage)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure(let error):
                    self.moviesState = .failed(error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] moviesResponse in
                guard let self = self else { return }
                if self.currentPage > moviesResponse.totalPages {
                    self.canLoadMorePages = false
                }
                movies.append(contentsOf: moviesResponse.list)
                self.moviesState = .loaded(movies)
            }
            .store(in: &disposables)
    }
    
    func fetchMovieDetails(_ id: String) {
        DispatchQueue.main.async {
            self.movieDetailState = .loading
        }
        movieFetchable
            .fetchMovieDetailBy(id: id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure(let error):
                    self.movieDetailState = .failed(error)
                    break
                case .finished:
                    break
                }
            } receiveValue: { [weak self] detailsResponse in
                guard let self = self else { return }
                self.movieDetailState = .loaded(detailsResponse)
            }
            .store(in: &disposables)
    }
    
}

