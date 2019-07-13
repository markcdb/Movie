//
//  MovieDetailsViewController.swift
//  Movie
//
//  Created by Mark Christian Buot on 14/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import UIKit

class MovieDetailsViewController: BaseTableViewController<MovieDetailsViewModel>,
UITableViewDelegate, UITableViewDataSource {

    let cellIdentifiers = [Cells.loaderCell,
                           Cells.errorCell,
                           Cells.movieHeaderCell,
                           Cells.movieDetailsCell]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = Titles.details
        // Do any additional setup after loading the view.
        for id in cellIdentifiers {
            tableView?.register(UINib(nibName: id,
                                      bundle: .main),
                                forCellReuseIdentifier: id)
        }
        
        tableView?.delegate        = self
        tableView?.dataSource      = self
        tableView?.refreshControl  = ViewFactory.createRefreshControler(self,
                                                                        action: #selector(pullRefresh))
        
        viewModel?.request()
    }
    
    override func push() {
        super.push()
        
        if let vc = GlobalVCFactory.createWebViewController() {
            
            navigationController?.pushViewController(vc,
                                                     animated: true)
        }
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        return
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if viewModel?.viewState.value == .error(nil) {
            return tableView.frame.height
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        if viewModel?.viewState.value == .success(nil) {
            return 2
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch viewModel?.viewState.value {
        case .loading(_)?:
            cell = CellFactory.createLoaderCell(tableView: tableView,
                                                indexPath: indexPath)
        case .success(_)?:
            if indexPath.row == 0 {
                cell = CellFactory.createMovieHeaderCell(viewModel: viewModel,
                                                         tableView: tableView,
                                                         indexPath: indexPath)
            } else {
                cell = CellFactory.createMovieDetailsCell(viewModel: viewModel,
                                                          tableView: tableView,
                                                          indexPath: indexPath,
                                                          delegate: self)
            }
        case .error(_)?:
            cell = CellFactory.createErrorCell(tableView: tableView,
                                               indexPath: indexPath)
        default:
            break
        }
        
        cell?.selectionStyle = .none
        cell?.separatorInset = .zero
        
        return cell ?? UITableViewCell()
    }
}

//MARK: - Custom methods
extension MovieDetailsViewController {
    
    @objc func pullRefresh() {
        guard let state = viewModel?.viewState.value else { return }
        guard state != .loading(nil) else {
            tableView?.endRefreshing()
            return
        }
        
        tableView?.beginRefreshing()
        viewModel?.request()
    }
}

//MARK: - Base VM Delegate
extension MovieDetailsViewController: BaseVMDelegate {
    
    func didUpdateModelWithState(_ viewState: ViewState) {
        switch viewState {
        case .success(_),
             .error(_):
            tableView?.endRefreshing()
            tableView?.reloadData()
        default:
            break
        }
    }
}

extension MovieDetailsViewController: MovieDetailsCellDelegate {
    
    func didTapBookButton() {
        push()
    }
}
