//
//  TvShowViewModel.swift
//  MoviZZat
//
//  Created by sherif on 16/08/2022.
//

import Foundation

class TvShowViewModel {
    
    
    let services:NetworkManager?
    var bindingResultTv : (()->()) = {}
    var TVData:TvModel?{
        didSet{
            bindingResultTv()
        }
    }
    
    init(services: NetworkManager) {
        self.services = services
    }
    
    func fetchTVShows(){
        NetworkManager.shared.getData(url: Constants.TvURLString + Constants.TvEndpointPopular) { (tvModel:TvModel?, error) in
            self.TVData = tvModel
            
            
        }
    }
    
}
