//
//  MovieDetailsViewModel.swift
//  Movie
//
//  Created by Mark Christian Buot on 11/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class MovieDetailsViewModel: BaseVMRepo<MovieRepository>, MovieListPresenter, MovieDetailsPresenter {
    internal var movie: MovieDetails?
    
    internal var movies: [MovieDetails] = []
    
    internal var id: Int?
    
    private var movieSorter: MovieSorter?

    override init(delegate: BaseVMDelegate?,
                  repository: MovieRepository) {
        super.init(delegate: delegate,
                   repository: repository)
        
        movieSorter = MovieSorter.defaultWithReleaseDate()
    }
    
    override func request() {
        super.request()
        
        viewState.accept(.loading(nil))
        
        repository?.get(params: id ?? 0,
                        completion: {[weak self] (movie, error) in
                            guard let self = self else { return }
                            
                            if error != nil {
                                self.viewState.accept(.error(nil))
                                return
                            }
                            
                            self.movie = movie
                            self.viewState.accept(.success(nil))
        })
    }
    
    internal func getSimilar(completion: @escaping (() -> Void)) {
        
        repository?.getSimilarFrom(id: String(id ?? 0),
                                   withSorter: movieSorter,
                                   completion: {[weak self] (movies, error) in
                                    guard let self = self else { return }
                                    
                                    if error != nil {
                                        completion()
                                        return
                                    }
                                    
                                    let page = (self.movieSorter?.page ?? 0) + 1
                                    self.movieSorter?.page = page

                                    self.movies.append(contentsOf: movies ?? [])
                                    completion()
        })
    }
    
    override func retry() {
        super.retry()
        
        resetPage()
        request()
    }
    
    internal func resetPage() {
        
        movieSorter?.page = 1
        movies.removeAll()
    }
}
