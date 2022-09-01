//
//  NowPlayingDetailVC.swift
//  MoviZZat
//
//  Created by sherif on 16/08/2022.
//

import UIKit
import Cosmos
class NowPlayingDetailVC: UIViewController {

    //MARK:- outlets
    @IBOutlet weak var movieImageView: UIImageView!{
        didSet{
            movieImageView.layer.cornerRadius = movieImageView.frame.width / 9
        }
    }
    @IBOutlet weak var wishListButton: UIButton!{
        didSet{
            wishListButton.layer.cornerRadius = wishListButton.frame.width / 9
        }
    }
    @IBOutlet weak var ratingCosmosView: CosmosView!
    @IBOutlet weak var overViewTextView: UITextView!
    @IBOutlet weak var movieNameLBL: UILabel!
    @IBOutlet weak var movieYearLBL: UILabel!
    
    @IBOutlet weak var originalLanguageLBL: UILabel!
    //MARK:-vars
    
    var detailNowPlaying:playingResults?
    var detalTvShow:TVResults?
    
    //MARK:-applifcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        passNowPlayingDataToDetailVC()
        passTVShowDataToDetailVC()
       
    }
  
    
    
    //MARK:- function Helper
    func passNowPlayingDataToDetailVC(){

        
        overViewTextView.text = detailNowPlaying?.overview ?? ""
        ratingCosmosView.text = "\( detailNowPlaying?.voteAverage ?? 0)"
        movieYearLBL.text = detailNowPlaying?.releaseDate
        movieNameLBL.text = detailNowPlaying?.title
        movieImageView.sd_setImage(with: URL(string: "\( Constants.imageUrl +  (detailNowPlaying?.backdropPath ?? "") )"), placeholderImage: UIImage(named: Constants.placeHolder))

    }
    
    
    func passTVShowDataToDetailVC(){

        overViewTextView.text = detalTvShow?.overview ?? ""
        ratingCosmosView.text = "\( detalTvShow?.voteAverage ?? 0)"
        movieYearLBL.text = detalTvShow?.firstAirDate
        movieNameLBL.text = detalTvShow?.name
        movieImageView.sd_setImage(with: URL(string: "\( Constants.imageUrl +  (detalTvShow?.backdropPath ?? "") )"), placeholderImage: UIImage(named: Constants.placeHolder))
        originalLanguageLBL.text = detalTvShow?.originalLanguage?.uppercased()
    }


    @IBAction func wishListButtonPressed(_ sender: UIButton) {
        
        
        
    }
}
