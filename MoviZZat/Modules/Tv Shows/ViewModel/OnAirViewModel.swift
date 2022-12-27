//
//  OnAirViewModel.swift
//  MoviZZat
//
//  Created by sherif on 17/08/2022.
//

import Foundation


class OnAirViewModel{
    
    let services:Networking?
    
    @Published var onAirData:TvModel?
    
    var bindingResultOnAirTv : (()->()) = {}
    var TVOnAirData:TvModel?{
        didSet{
            bindingResultOnAirTv()
        }
    }
    init(services: Networking) {
        self.services = services
    }
    
    
    func fetchOnAirTVShow(){
        
        NetworkManager.shared.getData(url: Constants.TvURLString + Constants.TvEndpointOnAir) { (TvOnAir:TvModel?,error ) in
            if let error = error {
                print(error)
            }else{
                self.onAirData = TvOnAir
            }
        }
    }
    
}
