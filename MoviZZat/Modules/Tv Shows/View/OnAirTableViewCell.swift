//
//  OnAirTableViewCell.swift
//  MoviZZat
//
//  Created by sherif on 17/08/2022.
//

import UIKit

class OnAirTableViewCell: UITableViewCell {

    @IBOutlet weak var tvShowImageView: UIImageView!
    @IBOutlet weak var tvShowNameLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
