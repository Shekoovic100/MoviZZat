//
//  DetailViewModel.swift
//  MoviZZat
//
//  Created by sherif on 26/07/2022.
//

import Foundation



class DetailViewModel {
    
    var services:NetworkManager?
    
    var bindingDetailMovie:(()->()) = {}
    var detilsData:MovieDetails?
    
    init(services:NetworkManager){
        self.services = services
    }

    
}
