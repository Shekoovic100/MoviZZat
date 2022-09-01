//
//  nowPlayingCollectionViewCell.swift
//  MoviZZat
//
//  Created by sherif on 15/08/2022.
//

import UIKit

class nowPlayingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nowPlayingImageView: UIImageView!{
        didSet{
            nowPlayingImageView.layer.cornerRadius = nowPlayingImageView.frame.size.width / 4
        }
    }
    
    @IBOutlet weak var nowplayingNameLBL: UILabel!
}
