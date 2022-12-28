//
//  MovieDetailsVC.swift
//  MoviZZat
//
//  Created by sherif on 26/07/2022.
//

import UIKit
import Cosmos
import CoreData
class MovieDetailsVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var wishlistbutton: UIButton!{
        didSet{
            wishlistbutton.layer.cornerRadius = wishlistbutton.frame.width / 9
        }
    }
    @IBOutlet weak var originalLangLBL: UILabel!
    @IBOutlet weak var overViewTextView: UITextView!
    @IBOutlet weak var ratingCosmosView: CosmosView!
    @IBOutlet weak var movieYearLBL: UILabel!
    @IBOutlet weak var movieNameLBL: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    //{
//        didSet{
//            movieImageView.layer.cornerRadius = movieImageView.frame.height / 2
//        }
 //   }
    
     //MARK: -vars
   
    var detailMovie: Results?
    var detailNowPlaying:Results?
    var moedel:Movies?
    
    
     //MARK: - applifcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie Details"
        passMovieDataToVc()
      
    }

     //MARK: -Helper functions

    func passMovieDataToVc(){

        overViewTextView.text = detailMovie?.overview ?? ""
        ratingCosmosView.text = "\( detailMovie?.voteAverage ?? 0)"
        movieYearLBL.text = detailMovie?.releaseDate
        movieNameLBL.text = detailMovie?.title
        movieImageView.sd_setImage(with: URL(string: "\( Constants.imageUrl + (detailMovie?.backdropPath ?? "") )"), placeholderImage: UIImage(named: Constants.placeHolder))
        originalLangLBL.text = detailMovie?.originalLanguage?.uppercased()
    }



    @IBAction func wishkistButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "", message: "Save to WishList?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        CoreDataStack.Shared.SaveToWishListMovie(favouriteMovies: detailMovie!)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
            
        }))
        self.navigationController?.present(alertController, animated: true)
    }
    
    
}
