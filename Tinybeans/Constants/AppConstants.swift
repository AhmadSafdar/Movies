//
//  AppConstants.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation

struct AppConstants {
    
    struct Movies {
        static let CardHeight = 300.0
        static let ImageHeight = 300.0
        static let NoInternetConnection = "Network connection seems to be offline."
    }
    
    struct PageTitle {
        static let MoviesView   = "Popular Movies"
        static let MovieDetailView = "Movie Detail"
    }
    
    struct MovieDb {
        static let ApiKey = ""
        static let AccessToken = ""
        static let BaseURLMovies = "https://api.themoviedb.org/3/discover/movie"
        static let BaseURLMovieDetail = "https://api.themoviedb.org/3/movie"
        static let ImageBaseUrl = "https://image.tmdb.org/t/p/w500"
    }
    
}
