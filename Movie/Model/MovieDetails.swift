//
//  MovieDetails.swift
//  Movie
//
//  Created by Mark Christian Buot on 10/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class MovieDetails: Movie {
    
    var belongs_to_collection: MovieCollection?
    var budget: Int?
    var genres: [Genre]?
    var homepage: String?
    var imdb_id: String?
    var production_companies: [Company]?
    var revenue: Int?
    var runtime: Int?
    var spoken_languages: [Language]?
    var status: String?
    var tagline: String?
}
