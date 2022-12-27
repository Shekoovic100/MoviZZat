//
//  TvShowViewModel.swift
//  MoviZZat
//
//  Created by sherif on 16/08/2022.
//

import Foundation

class TvShowViewModel {
    
    
    let services:Networking?
    
    @Published var TvShowsData:TvModel?
    
//    var bindingResultTv : (()->()) = {}
//    var TVData:TvModel?{
//        didSet{
//            bindingResultTv()
//        }
//    }
    
    init(services: Networking) {
        self.services = services
    }
    
    func fetchTVShows(){
        NetworkManager.shared.getData(url: Constants.TvURLString + Constants.TvEndpointPopular) { (tvModel:TvModel?, error) in
            self.TvShowsData = tvModel
            
            
        }
    }
    
}
