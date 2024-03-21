//
//  MockMovieApi.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/21/24.
//

import Foundation
import Combine

class MockMovieService: MovieFetchable {
    
    
    func fetchPopularMovie(page: Int) -> AnyPublisher<Movies, ServiceError> {
        let movies = Movies.mockData()
        return Just(movies)
                    .setFailureType(to: ServiceError.self)
                    .eraseToAnyPublisher()
    }
    
    func fetchMovieDetailBy(id: String) -> AnyPublisher<MovieDetail, ServiceError> {
        let detail = MovieDetail.mockData()
        return Just(detail)
                    .setFailureType(to: ServiceError.self)
                    .eraseToAnyPublisher()
    }
    
}
