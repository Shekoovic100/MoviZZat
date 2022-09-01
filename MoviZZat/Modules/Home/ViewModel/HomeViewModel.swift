//
//  HomeViewModel.swift
//  MoviZZat
//
//  Created by sherif on 18/07/2022.
//

import Foundation

class HomeViewModel {
    
    
    let services:NetworkManager?
    var bindingResultMovie : (()->Void) = {}
    var movieData:Movies?
    init(services: NetworkManager) {
        self.services = services
    }
    
    
    func fetchMovies(){
        NetworkManager.getPopularMovies { [weak self] MovieResponse in
            guard let self = self else{return}
            self.movieData = MovieResponse
            self.bindingResultMovie()
        }
    }
    
    
   
    
}
