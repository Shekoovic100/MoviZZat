//
//  LoginModel.swift
//  MoviZZat
//
//  Created by sherif on 29/08/2022.
//

import Foundation

class LoginModel:Codable {
    
    
    let userName:String?
    let password:String?
    let requestToken:String?
    
    enum CodingKeys:String, CodingKey{
        
        case userName = "username"
        case password
        case requestToken  = "request_token"
    }
    
    
}
