//
//  MoviesView.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import SwiftUI

struct MoviesView <Model>: View where Model:MoviesViewModelProtocol {
    
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModel: Model
    @State private var showDetailView = false
    @State private var selectedMovie: Movie?
    @State private var showNetworkAlert = false
    
    init (viewModel: Model) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            if networkMonitor.isConnected {
                moviesView()
            } else {
                Text(AppConstants.Movies.NoInternetConnection)
            }
        }
        .onChange(of: networkMonitor.isConnected) { connection in
            showNetworkAlert = connection == false
        }
        .alert(AppConstants.Movies.NoInternetConnection, isPresented:  $showNetworkAlert) {
            Button("OK", role: .cancel) { }
        }
        .task {
            viewModel.fetchMovies()
        }
    }
    
    func moviesView() -> some View {
        ScrollView {
            VStack {
                switch viewModel.moviesState {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView()
                case .failed(let error):
                    ErrorView(error: error)
                case . loaded(let moviesList):
                    if let moviesList = moviesList as? [Movie]  {
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(moviesList) { movie in
                                NavigationLink {
                                    MovieDetailView(viewModel: viewModel, movie: movie)
                                } label: {
                                    MovieCard(movie: movie)
                                        .frame(height: AppConstants.Movies.CardHeight)
                                        .task {
                                            if movie == moviesList.last {
                                                viewModel.fetchMovies()
                                            }
                                        }
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationBarTitle(AppConstants.PageTitle.MoviesView)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(viewModel: MockMoviesViewModel(moviesFetcher: MockMovieService()))
    }
}

