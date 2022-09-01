//
//  ViewController.swift
//  MoviZZat
//
//  Created by sherif on 18/07/2022.
//

import UIKit
import SDWebImage

class HomeVC: UIViewController {
    //MARK:-outlets
    
    @IBOutlet weak var titleMovieLBL: UILabel!
    @IBOutlet weak var titleLBLNowPlaying: UILabel!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!{
        
        didSet{
            moviesCollectionView.layer.cornerRadius = moviesCollectionView.frame.width / 10
            
        }
    }
    //MARK:- vars
    
    var homeVM:HomeViewModel?
    var nowPlayingVM:NowPlayingViewModel?
    
    //MARK:-app lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavgitionControllerApperance()
        setupTabBarApperance()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        passDataToController()
        
    }
    
    //MARK:-Helper Functions 
    
    func passDataToController(){
        
        homeVM = HomeViewModel(services: NetworkManager())
        homeVM?.bindingResultMovie = {
            DispatchQueue.main.async {
                self.moviesCollectionView.reloadData()
            }
        }
        
        nowPlayingVM = NowPlayingViewModel(services: NetworkManager())
        nowPlayingVM?.bindingResultNowPlaying = {
            DispatchQueue.main.async {
                self.nowPlayingCollectionView.reloadData()
            }
        }
        homeVM?.fetchMovies()
        nowPlayingVM?.fetchNowPlayingMovies()
        
        
    }
    
    
    
    
    
    func setupUI() {
        
        
        self.titleLBLNowPlaying.text =  "Now Playing"
        self.titleMovieLBL.text =  "Popular"
    }
    
    func setupNavgitionControllerApperance(){
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.systemYellow
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setupTabBarApperance(){
        
        let appearance = UITabBarAppearance()
            appearance.backgroundColor = .black
        self.tabBarController?.tabBar.tintColor = .yellow
        self.tabBarController?.tabBar.standardAppearance = appearance
        self.tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    
    
    
    
    @IBAction func movieFavouriteButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let wishListVC = storyboard?.instantiateViewController(withIdentifier: Constants.wishlistVCID) as? WishlistViewController else {return}
        wishListVC.title = "WishList"
        self.navigationController?.pushViewController(wishListVC, animated: true)
        
    }
    
    
}

//MARK:-Extension collectionView
extension HomeVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if collectionView == moviesCollectionView {
            
            return 1
        }else {
            return 1
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == moviesCollectionView {
            
            return homeVM?.movieData?.results.count ?? 0
        }else{
            return nowPlayingVM?.nowPlayingData?.results.count ?? 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == moviesCollectionView { //  movies collectionView
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.PopularMoviesCellID, for: indexPath) as? MoviesCollectionViewCell else {return
                UICollectionViewCell()
            }
            cell.movieNameLBL.text = homeVM?.movieData?.results[indexPath.row].title
            if let image = homeVM?.movieData?.results[indexPath.row].posterPath {
                cell.movieImageView.sd_setImage(with:URL(string: Constants.imageUrl + image) ,placeholderImage: UIImage(named: Constants.placeHolder))
            }
            
            return cell
            
        }else  { // nowplaying collectionView
            guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.nowPlayingCellID, for: indexPath) as? nowPlayingCollectionViewCell else{return
                UICollectionViewCell()
            }
            cell.nowplayingNameLBL.text = nowPlayingVM?.nowPlayingData?.results[indexPath.row].title
            if let image1 = nowPlayingVM?.nowPlayingData?.results[indexPath.row].posterPath {
                cell.nowPlayingImageView.sd_setImage(with:URL(string: Constants.imageUrl + image1) ,placeholderImage: UIImage(named: Constants.placeHolder))
            }
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if collectionView == moviesCollectionView {
            
            guard let vc  = storyboard?.instantiateViewController(withIdentifier: Constants.detialViewControllerIdentifier) as? MovieDetailsVC else {return}
            vc.detailMovie = homeVM?.movieData?.results[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if collectionView == nowPlayingCollectionView{
            
            guard let vc1  = storyboard?.instantiateViewController(withIdentifier: Constants.nowPlayingdetialViewControllerIdentifier) as? NowPlayingDetailVC else {return}
            vc1.detailNowPlaying = nowPlayingVM?.nowPlayingData?.results[indexPath.row]
            
            
            self.navigationController?.pushViewController(vc1, animated: true)
            
        }else {
            print("Error")
        }
    }
}







