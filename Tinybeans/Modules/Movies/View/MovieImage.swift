//
//  MovieImage.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation
import SwiftUI
import CachedAsyncImage

struct MovieImage: View {
    
    private let source: String
    
    init(source: String) {
        self.source = source
    }
    
    var body: some View {
        image()
    }
    
    @ViewBuilder
    func image() -> some View {
        CachedAsyncImage(url: URL(string: AppConstants.MovieDb.ImageBaseUrl + source)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .transition(.scale(scale: 0.1, anchor: .center))
        } placeholder: {
            Image("placeholder_image")
        }
        .cornerRadius(5)
    }
    
}
