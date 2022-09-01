//
//  MoviesCollectionViewCell.swift
//  MoviZZat
//
//  Created by sherif on 15/08/2022.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieImageView: UIImageView!{
        didSet{
            movieImageView.layer.cornerRadius = movieImageView.frame.size.width / 4
        }
    }
    
    @IBOutlet weak var movieNameLBL: UILabel!
     
        
    
}
