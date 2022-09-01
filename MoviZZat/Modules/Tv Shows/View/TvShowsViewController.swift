//
//  TvShowsViewController.swift
//  MoviZZat
//
//  Created by sherif on 16/08/2022.
//

import UIKit

class TvShowsViewController: UIViewController {

    @IBOutlet weak var tvShowsTableView: UITableView!
    
    var tvShowsVM : TvShowViewModel?
    var tvShowTvOnAir :OnAirViewModel?
    var similarTvVM:similiarTvShowViewModel?
  
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Tv Shows"
         setupNavgitionControllerApperance()
         setupTabBarApperance()
         
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        bindTvShowDataToVC()            // Data from tvShow ViewModel
        bindTvShowOnAirDataToVC()      // Data from onAirViewModel
       
    }
    
    
    func bindTvShowDataToVC(){
        
        tvShowsVM = TvShowViewModel(services: NetworkManager())
            tvShowsVM?.bindingResultTv = {
                DispatchQueue.main.async {
                    self.tvShowsTableView.reloadData()
                }
            }
        tvShowsVM?.fetchTVShows()
    }
    
    
    
    
    func bindTvShowOnAirDataToVC(){
    
        tvShowTvOnAir = OnAirViewModel(services: NetworkManager())
        tvShowTvOnAir?.bindingResultOnAirTv = {
                DispatchQueue.main.async {
                    self.tvShowsTableView.reloadData()
                }
            }
        tvShowTvOnAir?.fetchOnAirTVShow()
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
extension TvShowsViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            
            return tvShowsVM?.TVData?.results.count ?? 0
        }else {
           return tvShowTvOnAir?.TVOnAirData?.results.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdTvShow, for: indexPath) as? TvShowTableViewCell else {return
                UITableViewCell()
            }
            cell.tvShowNameLBL.text = tvShowsVM?.TVData?.results[indexPath.row].name
            if let image = tvShowsVM?.TVData?.results[indexPath.row].posterPath {
                cell.tvShowImageView.sd_setImage(with: URL(string: Constants.imageUrl + image))
            }
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdTvShowOnAir, for: indexPath) as? OnAirTableViewCell else {return
                UITableViewCell()
            }
            cell.tvShowNameLBL.text = tvShowTvOnAir?.TVOnAirData?.results[indexPath.row].name
            if let image = tvShowTvOnAir?.TVOnAirData?.results[indexPath.row].posterPath {
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
            guard let vc  = storyboard?.instantiateViewController(withIdentifier: Constants.nowPlayingdetialViewControllerIdentifier)as? NowPlayingDetailVC else {return}
            
            vc.detalTvShow = tvShowsVM?.TVData?.results[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            guard let vc  = storyboard?.instantiateViewController(withIdentifier: Constants.nowPlayingdetialViewControllerIdentifier)as? NowPlayingDetailVC else {return}
            
            vc.detalTvShow = tvShowTvOnAir?.TVOnAirData?.results[indexPath.row]
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
