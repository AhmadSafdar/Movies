//
//  JsonParser.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, ServiceError> {

  return Just(data)
    .decode(type: T.self, decoder: JSONDecoder())
    .mapError { error in
    .parsing(message: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
