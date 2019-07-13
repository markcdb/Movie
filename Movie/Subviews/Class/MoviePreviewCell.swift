//
//  MoviePreviewCell.swift
//  Movie
//
//  Created by Mark Christian Buot on 12/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import UIKit

class MoviePreviewCell: BaseCell {

    @IBOutlet weak var containerView: UIView?
    @IBOutlet weak var posterImage: UIImageView?
    @IBOutlet weak var backdropImage: UIImageView?
    @IBOutlet weak var blurView: UIVisualEffectView?
    @IBOutlet weak var labelContainer: UIView?
    @IBOutlet weak var subtitleDescription: BaseLabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.blurView?.isHidden             = true
        self.subtitleDescription?.textColor  = Colors.darkGray
        self.titleLabel?.textColor          = Colors.darkGray
        self.subTitleLabel?.textColor       = Colors.darkGray
        self.titleLabel?.alpha              = 1
        self.subTitleLabel?.alpha           = 1
        self.posterImage?.image             = nil
        self.backdropImage?.image           = nil
        self.backdropImage?.isHidden        = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

//MARK: - Custom methods
extension MoviePreviewCell {
    
    internal func setMovieImage(_ backdropUrl: String?,
                                posterUrl: String?) {
        
        if let backdropUrl = backdropUrl {
            /*
            setImageFrom(backdropUrl,
                         imageView: &backdropImage) {[weak self] (image, error, cacheType, url) in
                            guard let self = self,
                                error == nil else { return }
                            
                            if image != nil {
                                self.blurView?.isHidden             = false
                                self.subtitleDescription?.textColor  = .white
                                self.titleLabel?.textColor          = .white
                                self.subTitleLabel?.textColor       = .white
                                self.titleLabel?.alpha              = 0.7
                                self.subTitleLabel?.alpha           = 0.7
                                self.backdropImage?.isHidden        = false
                            }
            }
            */
        }
        
        if let posterUrl = posterUrl {
            setImageFrom(posterUrl,
                         imageView: &posterImage)
        }
    }
}
