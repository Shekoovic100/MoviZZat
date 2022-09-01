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
    
    
    
    func getDataLogin(userName:String,password:String){
        NetworkManager.shared.login(username: userName, password: password) { loginResponse, error in
            self.LoginData = loginResponse
            self.BindingResultLogin()
        }
    
    }
    
}
