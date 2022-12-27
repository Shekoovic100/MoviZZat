//
//  TvShowsViewController.swift
//  MoviZZat
//
//  Created by sherif on 16/08/2022.
//
import Combine
import UIKit

class TvShowsViewController: UIViewController {

    @IBOutlet weak var tvShowsTableView: UITableView!
    var cancellable:Set<AnyCancellable> = []
    var tvShowsVM = TvShowViewModel(services: NetworkManager())
    var tvShowTvOnAir = OnAirViewModel(services: NetworkManager())
    var similarTvVM:similiarTvShowViewModel?
  
    
     //MARK: - lifecycle
    
     override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Tv Shows"
         setupNavgitionControllerApperance()
         setupTabBarApperance()
         
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        BindTvShowViewModel()
        bindTvShowOnAirDataToVC()
    }
    
     //MARK: - Helper FunctionS
    
    func BindTvShowViewModel(){
        self.tvShowsVM.fetchTVShows()
        tvShowsVM.$TvShowsData.receive(on: DispatchQueue.main)
            .sink{ [weak self] tvShows in
                self?.tvShowsTableView.reloadData()
            }.store(in: &cancellable)
        
    }
    
    
    func bindTvShowOnAirDataToVC() {
        
        tvShowTvOnAir.$onAirData.receive(on: DispatchQueue.main)
            .sink{ [weak self] onAirTVshows in
                self?.tvShowsTableView.reloadData()
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
    
    /// with closures
//    func bindTvShowDataToVC(){
//
//        tvShowsVM = TvShowViewModel(services: NetworkManager())
//        tvShowsVM.bindingResultTv = {
//                DispatchQueue.main.async {
//                    self.tvShowsTableView.reloadData()
//                }
//            }
//        tvShowsVM?.fetchTVShows()
//
//    }

//
//    func bindTvShowOnAirDataToVC(){
//
//        self.tvShowTvOnAir.fetchOnAirTVShow()
//        tvShowTvOnAir = OnAirViewModel(services: NetworkManager())
//        tvShowTvOnAir.bindingResultOnAirTv = {
//                DispatchQueue.main.async {
//                    self.tvShowsTableView.reloadData()
//                }
//            }
//
//    }
    
}

 //MARK: - Extension for table View

extension TvShowsViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return tvShowsVM.TvShowsData?.results.count ?? 0
        }else {
            return tvShowTvOnAir.onAirData?.results.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdTvShow, for: indexPath) as? TvShowTableViewCell else {return
                UITableViewCell()
            }
            cell.tvShowNameLBL.text = tvShowsVM.TvShowsData?.results[indexPath.row].name
            if let image = tvShowsVM.TvShowsData?.results[indexPath.row].posterPath {
                cell.tvShowImageView.sd_setImage(with: URL(string: Constants.imageUrl + image))
            }
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdTvShowOnAir, for: indexPath) as? OnAirTableViewCell else {return
                UITableViewCell()
            }
            cell.tvShowNameLBL.text = tvShowTvOnAir.onAirData?.results[indexPath.row].name
            if let image = tvShowTvOnAir.onAirData?.results[indexPath.row].posterPath {
                cell.tvShowImageView.sd_setImage(with: URL(string: Constants.imageUrl + image))
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 150
            
        }else {
            return 150
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            guard let vc  = storyboard?.instantiateViewController(withIdentifier: Constants.nowPlayingDetialViewControllerIdentifier)as? NowPlayingDetailVC else {return}
            
            vc.detalTvShow = tvShowsVM.TvShowsData?.results[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            guard let vc  = storyboard?.instantiateViewController(withIdentifier: Constants.nowPlayingDetialViewControllerIdentifier)as? NowPlayingDetailVC else {return}
            vc.detalTvShow = tvShowTvOnAir.onAirData?.results[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            
            return "Popular TVShows"
        }else{
            return "On Air TVShows"
        }

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 50
        }else {
            return 50
        }
    }
    
   
    
}
