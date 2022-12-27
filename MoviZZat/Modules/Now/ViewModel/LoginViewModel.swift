//
//  LoginViewModel.swift
//  MoviZZat
//
//  Created by sherif on 29/08/2022.
//

import Foundation


class LoginViewModel {
    
    
    let services:NetworkManager?
    var BindingResultLogin : (()->Void) = {}
    var LoginData:LoginModel?
    init(services: NetworkManager) {
        self.services = services
    }
    
    
}
