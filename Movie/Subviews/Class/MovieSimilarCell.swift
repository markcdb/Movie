//
//  MovieSimilarCell.swift
//  Movie
//
//  Created by Mark Christian Buot on 18/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import UIKit

class MovieSimilarCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView?
    
    var presenter: MovieListPresenter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView?.delegate   = self
        collectionView?.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MovieSimilarCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        let count = presenter?.getMovieCount() ?? 0
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        return UICollectionViewCell()
    }
}
