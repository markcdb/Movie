//
//  MovieDetailsRepository.swift
//  Movie
//
//  Created by Mark Christian Buot on 11/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class MovieDetailsRepository: Repository<MovieDetails> {
    
    typealias SingleC   = ((MovieDetails?, Error?) -> ())

    override func get<U: LosslessStringConvertible>(params: U?,
                                                    completion: @escaping SingleC) {
        guard let param = params else { return }
        
        super.get(params: params,
                  completion: completion)
        
        let path = Paths.movie.replacingOccurrences(of: URLParameters.id,
                                                    with: String(param))
        
        let request = Request(path: path,
                              method: .get)
        
        createSuccessAndFail(request,
                             completion: completion)
    }
}

class MockMovieDetailsRepository: MovieDetailsRepository {
    
    internal var failable: Bool = false {
        didSet {
            (api as? MockAPI)?.failable = failable
        }
    }
    
    override init() {
        super.init()
        api = MockAPI(host: NetworkConfig.baseUrl)
    }
}

