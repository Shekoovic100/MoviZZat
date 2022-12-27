//
//  NowPlayingViewModel.swift
//  MoviZZat
//
//  Created by sherif on 21/08/2022.
//

import Foundation

class NowPlayingViewModel {
    
    let services:Networking?
    @Published var nowPlayingMovies:Movies?
    
    
//    var nowPlayingData: NowPlayingModel?{
//        didSet{
//            bindingResultNowPlaying()
//        }
//    }
    
    
//    var bindingResultNowPlaying : (()->Void) = {}
    
    init(services: Networking) {
        self.services = services
    }
    
    
    func fetchNowPlayingMovies(){
        
        NetworkManager.shared.getData(url: Constants.URLString + Constants.Endpoint) { (nowPlaying:Movies?,error) in
            if let error = error {
                print(error)
            }else{
                self.nowPlayingMovies = nowPlaying
            }
        }
    }
}
