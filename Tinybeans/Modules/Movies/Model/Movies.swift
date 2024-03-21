//
//  Movies.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation

struct Movies {
    let currentPage: Int
    let list: [Movie]
    let totalPages: Int
    let totalResults: Int
    
}

extension Movies: Codable {
    enum CodingKeys: String, CodingKey {
        case currentPage = "page"
        case list = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension Movies {
    
    static func mockData() -> Movies {
        return Movies(currentPage: 1, list: [Movie.mockData()], totalPages: 40, totalResults: 1000)
    }
}
