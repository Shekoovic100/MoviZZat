//
//  WishListTableViewCell.swift
//  MoviZZat
//
//  Created by sherif on 24/08/2022.
//

import UIKit

class WishListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var wishlistMovieName: UILabel!
    @IBOutlet weak var wishlistMovieImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wishlistMovieImageView.layer.cornerRadius = 25
        cellContentView.layer.borderColor = UIColor.yellow.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
