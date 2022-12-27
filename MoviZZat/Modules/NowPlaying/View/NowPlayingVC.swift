//
//  LoginViewController.swift
//  MoviZZat
//
//  Created by sherif on 28/08/2022.
//

import Combine
import UIKit


class NowPlayingVC: UIViewController {

     //MARK: - Outlets
    
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    
    var cancellable: Set<AnyCancellable> =  []
    var nowPlayingViewModel = NowPlayingViewModel(services: NetworkManager())


     //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavgitionControllerApperance()
        setupTabBarApperance()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bindDataToView()
    }

    
    
    
     //MARK: - Helper Function
    
    func bindDataToView(){
        
        self.nowPlayingViewModel.fetchNowPlayingMovies()
        nowPlayingViewModel.$nowPlayingMovies.receive(on: DispatchQueue.main)
            .sink {  [weak self] nowPlayingMovies in
                self?.nowPlayingCollectionView.reloadData()
            }.store(in: &cancellable)
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

extension NowPlayingVC:UICollectionViewDelegate,UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
     
            return nowPlayingViewModel.nowPlayingMovies?.results.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.nowPlayingCellID, for: indexPath) as? nowPlayingCollectionViewCell else{return
            UICollectionViewCell()
        }
        cell.nowplayingNameLBL.text = nowPlayingViewModel.nowPlayingMovies?.results[indexPath.row].title
        if let image1 = nowPlayingViewModel.nowPlayingMovies?.results[indexPath.row].posterPath {
            cell.nowPlayingImageView.sd_setImage(with:URL(string: Constants.imageUrl + image1) ,placeholderImage: UIImage(named: Constants.placeHolder))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let vc1  = storyboard?.instantiateViewController(withIdentifier: Constants.detialViewControllerIdentifier) as? MovieDetailsVC else {return}
        vc1.detailMovie = nowPlayingViewModel.nowPlayingMovies?.results[indexPath.row]
        self.navigationController?.pushViewController(vc1, animated: true)
        
    }
    
   
    
    
}
