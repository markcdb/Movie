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
                                indexPath: IndexPath) -> UITableViewCell? {
        
        let id = Cells.emptyCell
        let cell = tableView.dequeueReusableCell(withIdentifier: id)
        
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
        
        cell?.setWith(title: title ?? "",
                      subTitle: String(popularity ?? 0))
        return cell
    }
}
