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
    var movieData:Movies?{
        didSet{
            bindingResultMovie()
        }
    }
    init(services: NetworkManager) {
        self.services = services
    }
    
    
    func fetchMovies(){
        NetworkManager.shared.getData(url: Constants.popularMovies) {( MovieResponse:Movies?, error)in
            if let error = error {
                print(error)
            }else{
                self.movieData = MovieResponse
            }
        }
    }
    
    
   
    
}
