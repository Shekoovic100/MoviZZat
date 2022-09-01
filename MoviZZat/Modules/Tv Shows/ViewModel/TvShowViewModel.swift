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
    var TVData:TvModel?
    
    init(services: NetworkManager) {
        self.services = services
    }
    
    func fetchTVShows(){
        
        
        NetworkManager.shared.getData(url: Constants.TvURLString + Constants.TvEndpointPopular, tvId: nil) { ( tvModel:TvModel?) in
            self.TVData = tvModel
            self.bindingResultTv()
        }
    }
}
