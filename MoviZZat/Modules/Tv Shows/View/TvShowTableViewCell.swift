//
//  TvShowTableViewCell.swift
//  MoviZZat
//
//  Created by sherif on 16/08/2022.
//

import UIKit

class TvShowTableViewCell: UITableViewCell {

    @IBOutlet weak var tvShowNameLBL: UILabel!
    @IBOutlet weak var tvShowImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
