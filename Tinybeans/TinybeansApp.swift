//
//  TinybeansApp.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import SwiftUI

@main
struct TinybeansApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    let viewModel = MoviesViewModel(moviesFetcher: MovieService())
    
    var body: some Scene {
        WindowGroup {
            MoviesView(viewModel: viewModel)
                .environmentObject(networkMonitor)
        }
    }
}
