//
//  Movie.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation

struct Movie: Identifiable, Equatable, Hashable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
}

extension Movie: Codable {
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


extension Movie {
    
    static func mockData() -> Movie {
        return Movie(adult: true, backdropPath: "/mExN6lJHmLeGjwDmDrNNjR4MdCq.jpg", genreIds: [], id: 1011985, originalLanguage: "en", originalTitle: "Kung Fu Panda 4", overview: "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.", popularity: 6623.028, posterPath: "/wkfG7DaExmcVsGLR4kLouMwxeT5.jpg", releaseDate: "2024-03-02", title: "Kung Fu Panda 4", video: false, voteAverage: 6.874, voteCount: 199)
    }
}
