//
//  MovieService.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation
import Combine

protocol MovieFetchable {
    func fetchPopularMovie(page: Int) -> AnyPublisher<Movies, ServiceError>
    func fetchMovieDetailBy(id: String) -> AnyPublisher<MovieDetail,ServiceError>
}

class MovieService {
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
}

private extension MovieService {
    
    func urlForMovies(page: Int) throws -> URL? {
        let queryItems = [URLQueryItem(name: "include_adult", value: "false"), URLQueryItem(name: "language", value: "en-US"), URLQueryItem(name: "page", value: "\(page)"), URLQueryItem(name: "sort_by", value: "popularity.desc")]
        guard var components = URLComponents(url: URL(string: AppConstants.MovieDb.BaseURLMovies)! , resolvingAgainstBaseURL: true) else {
            throw ServiceError.request(message: "Invalid URL")
        }
        components.queryItems = queryItems
        return components.url
    }
    
    func urlForMovieDetailBy(_ id: String) throws -> URL? {
        let url = URL(string: AppConstants.MovieDb.BaseURLMovieDetail)!
        return url.appendingPathComponent(id)
    }

}


extension MovieService: MovieFetchable, Fetchable {
    func fetchPopularMovie(page: Int) -> AnyPublisher<Movies, ServiceError> {
        return fetch(with: try? self.urlForMovies(page: page), session: self.session)
    }
    
    func fetchMovieDetailBy(id: String) -> AnyPublisher<MovieDetail,ServiceError> {
        return fetch(with: try? self.urlForMovieDetailBy(id), session: self.session)
    }
}
