//
//  NowPlayingViewModel.swift
//  MoviZZat
//
//  Created by sherif on 21/08/2022.
//

import Foundation
class NowPlayingViewModel {
    
    let services:NetworkManager?
    var nowPlayingData: NowPlayingModel?{
        didSet{
            bindingResultNowPlaying()
        }
    }
    var bindingResultNowPlaying : (()->Void) = {}
    
    init(services: NetworkManager) {
        self.services = services
    }
    
    
    func fetchNowPlayingMovies(){
        
        NetworkManager.shared.getData(url: Constants.URLString + Constants.Endpoint) { (login:NowPlayingModel?,error) in
            if let error = error {
                print(error)
            }else{
                self.nowPlayingData = login
            }
        }
    }
}
