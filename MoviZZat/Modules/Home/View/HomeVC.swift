//
//  ViewController.swift
//  MoviZZat
//
//  Created by sherif on 18/07/2022.
//

import SDWebImage     // binding View Model
import Combine
import UIKit


class HomeVC: UIViewController {
    
    //MARK: -Outlets
    
    @IBOutlet weak var titleMovieLBL: UILabel!
    @IBOutlet weak var moviesCollectionView: UICollectionView!{
        didSet{
            moviesCollectionView.layer.cornerRadius = moviesCollectionView.frame.width / 10
        }
    }
    
    //MARK: - Vars
    
    var viewModel = HomeViewModel(services: NetworkManager())
    var cancellable: Set<AnyCancellable> =  []
    // var homeVM:HomeViewModel?
    //    var nowPlayingVM:NowPlayingViewModel?
    var nowPlayingViewModel = NowPlayingViewModel(services: NetworkManager())
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavgitionControllerApperance()
        setupTabBarApperance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //      passDataToController()
        bindHomeViewModel()
    }
    
    //MARK: - IBActions
    
    
    @IBAction func movieFavouriteButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let wishListVC = storyboard?.instantiateViewController(withIdentifier: Constants.wishlistVCID) as? WishlistViewController else {return}
        wishListVC.title = "WishList"
        self.navigationController?.pushViewController(wishListVC, animated: true)
    }
    
    //MARK: - Helper Functions
    
    /// binding with Combine
    func bindHomeViewModel(){
        self.viewModel.fetchMovies()
        viewModel.$movies.receive(on: DispatchQueue.main)
            .sink { [weak self] movies in
                self?.moviesCollectionView.reloadData()
            }.store(in: &cancellable)
    }
    
    ///  binding with Closure
    //    func passDataToController(){
    //
    //        homeVM = HomeViewModel(services: NetworkManager())
    //        homeVM?.bindingResultMovie = {
    //            DispatchQueue.main.async {
    //                self.moviesCollectionView.reloadData()
    //            }
    //        }
    //
    //        nowPlayingVM = NowPlayingViewModel(services: NetworkManager())
    //        nowPlayingVM?.bindingResultNowPlaying = {
    //            DispatchQueue.main.async {
    //                self.nowPlayingCollectionView.reloadData()
    //            }
    //        }
    //        homeVM?.fetchMovies()
    //        nowPlayingVM?.fetchNowPlayingMovies()
    //
    //
    //    }
    
    func setupUI() {
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
}

//MARK: - Extension collectionView
extension HomeVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       //            return homeVM?.movieData?.results.count ?? 0
            return viewModel.movies?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      //  movies collectionView
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.PopularMoviesCellID, for: indexPath) as? MoviesCollectionViewCell else {return
                UICollectionViewCell()
            }
            cell.movieNameLBL.text = viewModel.movies?.results[indexPath.row].title
            if let image = viewModel.movies?.results[indexPath.row].posterPath {
                cell.movieImageView.sd_setImage(with:URL(string: Constants.imageUrl + image) ,placeholderImage: UIImage(named: Constants.placeHolder))
            }
            
            return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  
            guard let vc  = storyboard?.instantiateViewController(withIdentifier: Constants.detialViewControllerIdentifier) as? MovieDetailsVC else {return}
            vc.detailMovie = viewModel.movies?.results[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
    }
}
