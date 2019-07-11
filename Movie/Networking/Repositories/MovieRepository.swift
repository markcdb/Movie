//
//  MovieRepository.swift
//  Movie
//
//  Created by Mark Christian Buot on 10/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class MovieRepository: Repository<Movie> {
    
    typealias SingleC   = ((Movie?, Error?) -> ())
    typealias ArrayC    = (([Movie]?, Error?) -> ())
    
    override func getList<U: LosslessStringConvertible>(params: U?,
                                                        completion: @escaping ArrayC) {
        guard let param = params else { return }
        
        super.getList(params: params,
                      completion: completion)
        
        let path = Paths.discover.appending(String(param))
        
        let request = Request(path: path,
                              method: .get)
        
        createSuccessAndFail(request,
                             completion: completion)
        
        requests.append(request)
    }
    
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

class MockMovieRepository: MovieRepository {
    
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
