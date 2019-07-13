//
//  MovieListViewController.swift
//  Movie
//
//  Created by Mark Christian Buot on 10/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import UIKit

class MovieListViewController: BaseTableViewController<MovieListViewModel>, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifiers = [Cells.loaderCell,
                           Cells.emptyCell,
                           Cells.moviePreviewCell]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for id in cellIdentifiers {
            tableView?.register(UINib(nibName: id,
                                      bundle: .main),
                                forCellReuseIdentifier: id)
        }
        
        tableView?.delegate     = self
        tableView?.dataSource   = self
        viewModel               = GlobalVMFactory.createMovieListVM(delegate: self)
        viewModel?.request()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 65
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        let count = viewModel?.getMovieCount() ?? 0
        
        if count > 0 {
            return count
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch viewModel?.viewState.value {
        case .loading(_)?:
            cell = createLoaderCell(tableView: tableView,
                                    indexPath: indexPath)
        case .success(_)?:
            cell = createMoviePreviewCell(tableView: tableView,
                                          indexPath: indexPath)
        case .error(_)?:
            cell = createErrorCell(tableView: tableView,
                                   indexPath: indexPath)
        default:
            break
        }
        
        return cell ?? UITableViewCell()
    }
}

//MARK: - Custom methods
extension MovieListViewController {
    private func createLoaderCell(tableView: UITableView,
                                  indexPath: IndexPath) -> LoaderCell? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.loaderCell,
                                                 for: indexPath) as? LoaderCell
        
        cell?.selectionStyle = .none
        cell?.loadingIndicator.startAnimating()
        
        return cell
    }
    
    private func createMoviePreviewCell(tableView: UITableView,
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

    private func createErrorCell(tableView: UITableView,
                                 indexPath: IndexPath) -> UITableViewCell? {
        let id = Cells.emptyCell
        let cell = tableView.dequeueReusableCell(withIdentifier: id)
        
        return cell
    }
}

//MARK: - View model delegate
extension MovieListViewController: BaseVMDelegate {
    
    func didUpdateModelWithState(_ viewState: ViewState) {
        tableView?.reloadData()
    }
}
