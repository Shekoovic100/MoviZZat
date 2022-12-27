//
//  NetworkManager.swift
//  MoviZZat
//
//  Created by sherif on 18/07/2022.
//

import Foundation
import Alamofire


protocol Networking {
    
    func getData<T>(url:String ,completionHandler : @escaping (T?,Error?)-> Void)where T :Decodable
}

class NetworkManager:Networking {
    
   // use singleton:
    static let shared = NetworkManager()

    // Generic Func GetData For NetworkLayer
    
    func getData<T>(url:String ,completionHandler : @escaping (T?,Error?)-> Void)where T :Decodable{
        AF.request(url,method: .get,encoding: URLEncoding.queryString).responseDecodable(of: T.self) {response in
            switch response.result {
          
            case .success:
                do {
                    completionHandler(try response.result.get(),nil)
                }catch{
                    completionHandler(nil,error)
                }
            case .failure(let error):
                completionHandler(nil,error)
            }
       }
    }

    
}
