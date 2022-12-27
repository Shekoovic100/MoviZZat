//
//  NowPlayingDetailVC.swift
//  MoviZZat
//
//  Created by sherif on 16/08/2022.
//
import Cosmos
import UIKit


class NowPlayingDetailVC: UIViewController {

    //MARK:- outlets
    @IBOutlet weak var movieImageView: UIImageView!
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
    
    //var detailNowPlaying:playingResults?
    var detalTvShow:TVResults?
    var detailNowPlaying:Results?
    var detailMovie:Results?
    //MARK:-applifcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        
      //  passToVC()
        passNowPlayingDataToDetailVC()
        DispatchQueue.main.async {
            self.passTVShowDataToDetailVC()
        }
    }
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        passMovieDataToVc()
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
    
    
    
    func passToVC(){
        
        overViewTextView.text = detailNowPlaying?.overview ?? ""
        ratingCosmosView.text = "\( detailNowPlaying?.voteAverage ?? 0)"
        movieYearLBL.text = detailNowPlaying?.releaseDate
        movieNameLBL.text = detailNowPlaying?.title
        movieImageView.sd_setImage(with: URL(string: "\( Constants.imageUrl + (detailNowPlaying?.backdropPath ?? "") )"), placeholderImage: UIImage(named: Constants.placeHolder))
        originalLanguageLBL.text = detailNowPlaying?.originalLanguage?.uppercased()
        
    }
    
    
    func passMovieDataToVc(){
        
        overViewTextView.text = detailMovie?.overview ?? ""
        ratingCosmosView.text = "\( detailMovie?.voteAverage ?? 0)"
        movieYearLBL.text = detailMovie?.releaseDate
        movieNameLBL.text = detailMovie?.title
        movieImageView.sd_setImage(with: URL(string: "\( Constants.imageUrl + (detailMovie?.backdropPath ?? "") )"), placeholderImage: UIImage(named: Constants.placeHolder))
        originalLanguageLBL.text = detailMovie?.originalLanguage?.uppercased()
    }


    @IBAction func wishListButtonPressed(_ sender: UIButton) {
        
        
        
    }
}
