//
//  MovieCard.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation


import Foundation
import SwiftUI

struct MovieCard: View {
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        VStack(spacing: 10) {
            MovieImage(source: movie.posterPath)
            Text(movie.title)
                .movieHeaderStyle()
        }
        .movieCardStyle()
    }
}
