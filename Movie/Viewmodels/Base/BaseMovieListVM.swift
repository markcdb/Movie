//
//  BaseMovieVM.swift
//  Movie
//
//  Created by Mark Christian Buot on 12/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class BaseMovieListVM: BaseVMRepo<MovieRepository> {
    
    var movies: [MovieDetails] = []

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
}

//MARK: - Custom methods
extension BaseMovieListVM {
    
    internal func getIsoLanguageStringFrom(_ languages: [Language]) -> [String] {
        
        return languages.compactMap({ $0.iso_639_1 ?? "" })
    }
    
    internal func getGenreNameStringFrom(_ genres: [Genre]) -> [String] {
        
        return genres.compactMap({ $0.name ?? "" })
    }

    internal func getCompanyNameStringFrom(_ companies: [Company]) -> [String] {
        
        return companies.compactMap({ $0.name ?? "" })
    }
    
    internal func getCollectionNameStringFrom(_ movieCollections: [MovieCollection]) -> [String] {
        
        return movieCollections.compactMap({ $0.name ?? "" })
    }
}

class BaseMovieDetailsVM: BaseVMRepo<MovieRepository> {
    
    var movie: MovieDetails?
    
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
    
    internal func getSpokenLanguage() -> [Language]? {
        
        return movie?.spoken_languages
    }
    
    internal func getStatus() -> String? {
        
        return movie?.status
    }
    
    internal func getTagline() -> String? {
        
        return movie?.tagline
    }
}
