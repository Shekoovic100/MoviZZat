//
//  similiarTvShowViewModel.swift
//  MoviZZat
//
//  Created by sherif on 18/08/2022.
//

import Foundation


class similiarTvShowViewModel{
    
    let services:NetworkManager?
    var bindingSimilarTvShow : (()->()) = {}
    var SimilarTVData:TvModel?{
        didSet{
            bindingSimilarTvShow()
        }
    }
    init(services: NetworkManager) {
        self.services = services
    }
    
    func fetchSimilarTvShow(tvShowId :Int) {
        
        NetworkManager.shared.getData(url: Constants.similarURL + Constants.SimilarTvShowEndPoint) { (similiarTvShow : TvModel?, error)in
            if let error = error {
                print(error)
            }else{
                self.SimilarTVData = similiarTvShow
            }
        }
    }
    
    
}
