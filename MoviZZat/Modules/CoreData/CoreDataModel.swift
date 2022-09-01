//
//  CoreDataModel.swift
//  MoviZZat
//
//  Created by sherif on 23/08/2022.
//

import Foundation
import CoreData


struct CoreDataModel {
    
    

    

  
    let posterPath: String?
    let title: String?
    enum CodingKeys: String, CodingKey {
        
            case posterPath = "poster_path"
            case title ,id
        }
   
     init(posterPath: String?, title: String?) {
        self.posterPath = posterPath
        self.title = title
    }
}

