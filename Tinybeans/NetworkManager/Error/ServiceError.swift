//
//  ApiError.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation

import Foundation

enum ServiceError: Error {
    case request(message: String)
    case network(message: String)
    case status(message: String)
    case parsing(message: String)
    case other(message: String)
    
    static func map(_ error: Error) -> ServiceError {
        print(error.localizedDescription)
        return (error as? ServiceError) ?? .other(message: error.localizedDescription)
    }

}
