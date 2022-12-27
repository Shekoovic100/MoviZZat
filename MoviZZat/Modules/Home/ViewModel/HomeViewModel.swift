//
//  HomeViewModel.swift
//  MoviZZat
//
//  Created by sherif on 18/07/2022.
//

import Foundation


class HomeViewModel:ObservableObject {
    
    
    let services:Networking?
    
    @Published var movies:Movies?
    
//    var bindingResultMovie : (()->Void) = {}
//    var movieData:Movies?{
//        didSet{
//            bindingResultMovie()
//        }
//    }
    
    init(services: Networking) {
        self.services = services
    }
    
    
    func fetchMovies(){
        NetworkManager.shared.getData(url: Constants.popularMovies) { [weak self]( MovieResponse:Movies?, error)in
            if let error = error {
                print(error)
            }else{
                self?.movies = MovieResponse
            }
        }
    }
    
    
   
    
}
