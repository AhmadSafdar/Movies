//
//  Fetchable.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation
import Combine
protocol Fetchable {
    func fetch<T>(with url: URL?, session: URLSession) -> AnyPublisher<T,ServiceError> where T: Decodable
}

extension Fetchable {
    func fetch<T>(with url: URL?, session: URLSession) -> AnyPublisher<T,ServiceError> where T: Decodable {
        guard let url = url else {
            return Fail(error: ServiceError.request(message: "Invalid URL")).eraseToAnyPublisher()
        }
        print(url.absoluteString)
        var request = URLRequest(url: url)
        request.addValue("Bearer " + AppConstants.MovieDb.AccessToken, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return session.dataTaskPublisher(for: request)
          .mapError { error in
              ServiceError.network(message: error.localizedDescription)
          }
          .flatMap { pair in
            decode(pair.data)
          }
          .eraseToAnyPublisher()
    }
}
