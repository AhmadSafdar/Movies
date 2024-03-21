//
//  Model.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation

struct MovieDetail {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let popularity: Double
    let overview: String
    let title: String
    let releaseDate: String
    let posterPath: String
}

extension MovieDetail: Codable {
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id
        case popularity
        case overview
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}

extension MovieDetail {
    
    static func mockData() -> MovieDetail {
        return MovieDetail(adult: true, backdropPath: "/mExN6lJHmLeGjwDmDrNNjR4MdCq.jpg", id: 1011985, popularity: 6623.028, overview: "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.", title: "Kung Fu Panda 4", releaseDate: "2024-03-02", posterPath: "/wkfG7DaExmcVsGLR4kLouMwxeT5.jpg")
    }
}
