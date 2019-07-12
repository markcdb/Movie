//
//  GlobalFactory.swift
//  Movie
//
//  Created by Mark Christian Buot on 03/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class GlobalVMFactory {
    
    static func createMovieListVM(repository: MovieRepository? = nil,
                                  delegate: BaseVMDelegate?) -> MovieListViewModel {
        let viewModel = MovieListViewModel(delegate: delegate,
                                           repository: repository ?? MovieRepository())
        
        return viewModel
    }
    
    static func createMovieDetailsVM(repository: MovieDetailsRepository? = nil,
                                     delegate: BaseVMDelegate?) -> MovieDetailsViewModel {
        
        let viewModel = MovieDetailsViewModel(delegate: delegate,
                                              repository: repository ?? MovieDetailsRepository())
        
        return viewModel
    }
}
