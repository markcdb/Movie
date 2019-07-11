//
//  MovieViewModel.swift
//  Movie
//
//  Created by Mark Christian Buot on 10/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MovieListViewModel: BaseVMRepo<MovieRepository> {
    
    var movies: [Movie]?
    
    override init(delegate: BaseVMDelegate,
                  repository: MovieRepository) {
        super.init(delegate: delegate,
                   repository: repository)
        self.startBinding()
    }
    
    override func startBinding() {
        super.startBinding()
    }
    
    override func request() {
        super.request()
        
        self.viewState?.accept(.loading(nil))
        
        repository?.getList(params: "",
                            completion: {[weak self] (movies, error) in
                                guard let self = self else {
                                    return
                                }
                                
                                if error != nil {
                                    self.viewState?.accept(.error(nil))
                                    return
                                }
                                
                                self.movies = movies
                                self.viewState?.accept(.success(nil))
        })
    }
}
