//
//  BaseMovieVM.swift
//  Movie
//
//  Created by Mark Christian Buot on 12/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class BaseMovieListVM: BaseVMRepo<MovieRepository> {
    
    internal var movies: [MovieDetails] = []

    internal func getMovieCount() -> Int {
        
        return movies.count
    }
    
    internal func getMovieIdAt(_ index: Int) -> Int? {
        guard index < movies.count else { return nil }

        return movies[index].id
    }
    
    internal func getMovieVoteCountAt(_ index: Int) -> Int? {
        guard index < movies.count else { return nil }
        
        return movies[index].vote_count
    }
    
    internal func getMovieVideoAt(_ index: Int) -> Bool? {
        guard index < movies.count else { return nil }
        
        return movies[index].video
    }
    
    internal func getMovieVoteAverageAt(_ index: Int) -> Double? {
        guard index < movies.count else { return nil }
        
        return movies[index].vote_average
    }
    
    internal func getMovieTitleAt(_ index: Int) -> String? {
        guard index < movies.count else { return nil }
        
        return movies[index].title
    }
    
    internal func getMoviePopularityAt(_ index: Int) -> Double? {
        guard index < movies.count else { return nil }
        
        return movies[index].popularity
    }
    
    internal func getMoviePosterPathAt(_ index: Int) -> String? {
        guard index < movies.count else { return nil }
        
        return movies[index].poster_path
    }
    
    internal func getOriginalLanguageAt(_ index: Int) -> String? {
        guard index < movies.count else { return nil }
        
        return movies[index].original_language
    }
    
    internal func getOriginalTitleAt(_ index: Int) -> String? {
        guard index < movies.count else { return nil }
        
        return movies[index].original_title
    }
    
    internal func getGenreIdsAt(_ index: Int) -> [Int]? {
        guard index < movies.count else { return nil }
        
        return movies[index].genre_ids
    }
    
    internal func getBackdropPathAt(_ index: Int) -> String? {
        guard index < movies.count else { return nil }
    
        return movies[index].backdrop_path
    }
    
    internal func getAdultAt(_ index: Int) -> Bool? {
        guard index < movies.count else { return nil }
        
        return movies[index].adult
    }
    
    internal func getOverviewAt(_ index: Int) -> String? {
        guard index < movies.count else { return nil }
        
        return movies[index].overview
    }
    
    internal func getReleaseDateAt(_ index: Int) -> String? {
        guard index < movies.count else { return nil }
        
        return movies[index].release_date
    }

    internal func getBelongsToCollectionAt(_ index: Int) -> MovieCollection? {
        guard index < movies.count else { return nil }
        
        return movies[index].belongs_to_collection
    }
    
    internal func getBudgetAt(_ index: Int) -> Int? {
        guard index < movies.count else { return nil }
        
        return movies[index].budget
    }
    
    internal func getGenreAt(_ index: Int) -> [Genre]? {
        guard index < movies.count else { return nil }
        
        return movies[index].genres
    }
    
    internal func getHomepageAt(_ index: Int) -> String? {
        guard index < movies.count else { return nil }
        
        return movies[index].homepage
    }
    
    internal func getImdbIdAt(_ index: Int) -> String? {
        guard index < movies.count else { return nil }
        
        return movies[index].imdb_id
    }
    
    internal func getProductionCompaniesAt(_ index: Int) -> [Company]? {
        guard index < movies.count else { return nil }
        
        return movies[index].production_companies
    }
    
    internal func getRevenueAt(_ index: Int) -> Int? {
        guard index < movies.count else { return nil }
        
        return movies[index].revenue
    }
    
    internal func getRuntimeAt(_ index: Int) -> Int? {
        guard index < movies.count else { return nil }
        
        return movies[index].runtime
    }
    
    internal func getSpokenLanguageAt(_ index: Int) -> [Language]? {
        guard index < movies.count else { return nil }
        
        return movies[index].spoken_languages
    }
    
    internal func getStatusAt(_ index: Int) -> String? {
        guard index < movies.count else { return nil }
        
        return movies[index].status
    }
    
    internal func getTaglineAt(_ index: Int) -> String? {
        guard index < movies.count else { return nil }
        
        return movies[index].tagline
    }
    
    internal func getIsoLanguageStringAt(_ index: Int) -> [String] {
        guard let languages = getSpokenLanguageAt(index) else { return [] }
        
        return MovieDetails.getIsoLanguageStringFrom(languages)
    }
    
    internal func getGenreNameStringAt(_ index: Int) -> [String] {
        guard let genres = getGenreAt(index) else { return [] }
        
        return MovieDetails.getGenreNameStringFrom(genres)
    }
    
    internal func getCompanyNameStringAt(_ index: Int) -> [String] {
        guard let companies = getProductionCompaniesAt(index) else { return [] }
        
        return MovieDetails.getCompanyNameStringFrom(companies)
    }
}
