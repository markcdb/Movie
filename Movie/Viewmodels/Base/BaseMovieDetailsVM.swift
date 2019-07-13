//
//  BaseMovieDetailsVM.swift
//  Movie
//
//  Created by Mark Christian Buot on 12/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class BaseMovieDetailsVM: BaseVMRepo<MovieRepository> {
    
    internal var movie: MovieDetails?
    
    internal func getMovieId() -> Int? {
        
        return movie?.id
    }
    
    internal func getMovieVoteCount() -> Int? {
        
        return movie?.vote_count
    }
    
    internal func getMovieVideo() -> Bool? {
        
        return movie?.video
    }
    
    internal func getMovieVoteAverage() -> Double? {
        
        return movie?.vote_average
    }
    
    internal func getMovieTitle() -> String? {
        
        return movie?.title
    }
    
    internal func getMoviePopularity() -> Double? {
        
        return movie?.popularity
    }
    
    internal func getMoviePosterPath() -> String? {
        
        return movie?.poster_path
    }
    
    internal func getOriginalLanguage() -> String? {
        
        return movie?.original_language
    }
    
    internal func getOriginalTitle() -> String? {
        
        return movie?.original_title
    }
    
    internal func getGenreIds() -> [Int]? {
        
        return movie?.genre_ids
    }
    
    internal func getBackdropPath() -> String? {
        
        return movie?.backdrop_path
    }
    
    internal func getAdult() -> Bool? {
        
        return movie?.adult
    }
    
    internal func getOverview() -> String? {
        
        return movie?.overview
    }
    
    internal func getReleaseDate() -> String? {
        
        return movie?.release_date
    }
    
    internal func getBelongsToCollection() -> MovieCollection? {
        
        return movie?.belongs_to_collection
    }
    
    internal func getBudget() -> Int? {
        
        return movie?.budget
    }
    
    internal func getGenre() -> [Genre]? {
        
        return movie?.genres
    }
    
    internal func getGenreString() -> String? {
        
        let array = movie?.genres?.compactMap({ $0.name ?? "" })
        
        return array?.joined(separator: ", ")
    }
    
    internal func getHomepage() -> String? {
        
        return movie?.homepage
    }
    
    internal func getImdbId() -> String? {
        
        return movie?.imdb_id
    }
    
    internal func getProductionCompanies() -> [Company]? {
        
        return movie?.production_companies
    }
    
    internal func getRevenue() -> Int? {
        
        return movie?.revenue
    }
    
    internal func getRuntime() -> Int? {
        
        return movie?.runtime
    }
    
    internal func getRuntimeString() -> String {
        
        return "\(getRuntime() ?? 0) minutes"
    }
    
    internal func getSpokenLanguage() -> [Language]? {
        
        return movie?.spoken_languages
    }
    
    internal func getSpokenLanguageString() -> String? {
        
        let array = movie?.spoken_languages?.compactMap({ $0.name ?? "" })
        
        return array?.joined(separator: ", ")
    }
    
    internal func getStatus() -> String? {
        
        return movie?.status
    }
    
    internal func getTagline() -> String? {
        
        return movie?.tagline
    }
}
