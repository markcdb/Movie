//
//  GlobalCellFactory.swift
//  Movie
//
//  Created by Mark Christian Buot on 14/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation
import UIKit

typealias CellFactory = GlobalCellFactory

class GlobalCellFactory {
    static func createLoaderCell(tableView: UITableView,
                                 indexPath: IndexPath) -> LoaderCell? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.loaderCell,
                                                 for: indexPath) as? LoaderCell
        
        cell?.selectionStyle = .none
        cell?.loadingIndicator.startAnimating()
        
        return cell
    }
    
    static func createErrorCell(tableView: UITableView,
                                indexPath: IndexPath) -> ErrorCell? {
        
        let id = Cells.errorCell
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ErrorCell
        
        return cell
    }
    
    static func createMoviePreviewCell(viewModel: MovieListViewModel?,
                                       tableView: UITableView,
                                       indexPath: IndexPath) -> MoviePreviewCell? {
        
        let id           = Cells.moviePreviewCell
        let title        = viewModel?.getMovieTitleAt(indexPath.row)
        let popularity   = viewModel?.getMoviePopularityAt(indexPath.row)
        let posterPath   = viewModel?.getMoviePosterPathAt(indexPath.row)
        let backdropPath = viewModel?.getBackdropPathAt(indexPath.row)
        let cell         = tableView.dequeueReusableCell(withIdentifier: id) as? MoviePreviewCell
        
        let posterUrl    = posterPath?.getImageUrlStringWith(cell?.posterImage?.frame.width)
        let backdropUrl  = backdropPath?.getImageUrlStringWith(cell?.backdropImage?.frame.width)
        
        cell?.setMovieImage(backdropUrl,
                            posterUrl: posterUrl)
        
        cell?.setWith(title: title ?? blank_,
                      subTitle: String(popularity ?? 0))
        return cell
    }
    
    static func createMovieHeaderCell(viewModel: MovieDetailsViewModel?,
                                      tableView: UITableView,
                                      indexPath: IndexPath) -> MovieHeaderCell? {
        
        let id           = Cells.movieHeaderCell
        let posterPath   = viewModel?.getMoviePosterPath()
        let backdropPath = viewModel?.getBackdropPath()
        let title        = viewModel?.getMovieTitle()
        let popularity   = viewModel?.getMoviePopularity()

        //let duration     = viewMode
        let cell         = tableView.dequeueReusableCell(withIdentifier: id) as? MovieHeaderCell
        
        let posterUrl    = posterPath?.getImageUrlStringWith(cell?.posterImage?.frame.width)
        let backdropUrl  = backdropPath?.getImageUrlStringWith(cell?.backdropImage?.frame.width)
        
        cell?.setWith(title: title ?? blank_,
                      subTitle: String(popularity ?? 0.0))
        
        cell?.setMovieImage(backdropUrl,
                            posterUrl: posterUrl)
        
        return cell
    }
    
    static func createMovieDetailsCell(viewModel: MovieDetailsViewModel?,
                                       tableView: UITableView,
                                       indexPath: IndexPath,
                                       delegate: MovieDetailsCellDelegate) -> MovieDetailsCell? {
        
        let id           = Cells.movieDetailsCell
        let sypnosis     = viewModel?.getOverview() ?? blank_
        let genres       = viewModel?.getGenreString() ?? blank_
        let languages    = viewModel?.getSpokenLanguageString() ?? blank_
        let runtime      = viewModel?.getRuntimeString()
        
        let cell         = tableView.dequeueReusableCell(withIdentifier: id) as? MovieDetailsCell
        
        cell?.sypnosisLabel?.text   = sypnosis.isEmpty == true ? "N/A" : sypnosis
        cell?.genresLabel?.text     = genres.isEmpty == true ? "n/a" : genres
        cell?.languagesLabel?.text  = languages.isEmpty == true ? "n/a" : languages
        cell?.durationLabel?.text   = runtime
        cell?.delegate              = delegate
        
        return cell
    }
}
