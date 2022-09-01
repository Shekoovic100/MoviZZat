//
//  NetworkManager.swift
//  MoviZZat
//
//  Created by sherif on 18/07/2022.
//

import Foundation
import Alamofire


class NetworkManager {
    
   // try to use singleton:
    static let shared = NetworkManager()
    
    static  func getPopularMovies(completionHandler: @escaping (Movies?) -> Void ) {
         AF.request("https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1").responseDecodable(of: Movies.self) { response in
             
            guard let moviesResponse = response.value else{return}
            completionHandler(moviesResponse)
        }
    }
    

    // Generic Func GetData For NetworkLayer
    
    func getData<T:Codable>(url:String, tvId :Int? , completionHandler : @escaping (T?)-> Void){
        AF.request(url).responseDecodable(of: T?.self) { response in
           guard let Response = response.value else{return}
           completionHandler(Response)

       }
    }

    

               
    
    func login(username:String ,password:String ,completionHandler: @escaping(LoginModel?,Error?)->Void){
        let loginUrl = "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=\(Constants.apiKey)"
        let paramaters = [
            "username": username,
            "password": password,
            "request_token": "cf4e846767cd31c7e27301e709987159bd6e6059"
          ]
        AF.request(loginUrl, method: .post, parameters: paramaters, encoding: JSONEncoding.default).response{ response  in
            print(response)
            switch response.result {
            
            case.success(let value):
                print(value)
                guard let data = response.data else{return}
                do{
                    let loginData = try JSONDecoder().decode(LoginModel.self, from: data)
                    
                    completionHandler(loginData, nil)
                }catch let error{
                    print("Error in Data")
                    completionHandler(nil, error)
                }
                
            case.failure(let error):
                print(error)
                completionHandler(nil, error)
               
            }
        }

    }
}
