//
//  MovieDetailsViewModel.swift
//  Movie
//
//  Created by Mark Christian Buot on 11/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class MovieDetailsViewModel: BaseVMRepo<MovieRepository>,
BaseMovieList,
BaseMovieDetails {
    internal var movie: MovieDetails?
    
    internal var movies: [MovieDetails] = []
    
    internal var id: Int?
    
    override init(delegate: BaseVMDelegate?,
                  repository: MovieRepository) {
        super.init(delegate: delegate,
                   repository: repository)
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
    
    override func retry() {
        super.retry()
        
        request()
    }
    
    func getSimilar() {
        
        viewState.accept(.loading(nil))
        
        repository?.getSimilarFrom(id: String(id ?? 0),
                                   completion: {[weak self] (movies, error) in
                                    guard let self = self else { return }
                                    
                                    if error != nil {
                                        self.viewState.accept(.error(nil))
                                        return
                                    }
                                    
                                    
        })
    }
}
