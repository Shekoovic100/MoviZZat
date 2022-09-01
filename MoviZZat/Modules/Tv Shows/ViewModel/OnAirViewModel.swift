//
//  OnAirViewModel.swift
//  MoviZZat
//
//  Created by sherif on 17/08/2022.
//

import Foundation


class OnAirViewModel{
    
    let services:NetworkManager?
    var bindingResultOnAirTv : (()->()) = {}
    var TVOnAirData:TvModel?
    init(services: NetworkManager) {
        self.services = services
    }
    
    
    func fetchOnAirTVShow(){
        
        NetworkManager.shared.getData(url: Constants.TvURLString + Constants.TvEndpointOnAir, tvId: nil) { (TvOnAir:TvModel?) in
            self.TVOnAirData = TvOnAir
            self.bindingResultOnAirTv()
        }
    }
    
}
