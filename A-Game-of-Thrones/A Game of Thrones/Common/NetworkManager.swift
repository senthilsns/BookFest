//
//  NetworkManager.swift
//  A Game of Thrones
//
//  Created by Senthil on 10/09/23.
//


import UIKit

class NetworkManager{
    
    //MARK: Shared Instance
    class var SharedInstance: NetworkManager {
        struct Global {
            static let instance = NetworkManager()
        }
        return Global.instance
    }
    
    
    //MARK: Reachability Check
    func isNetworkReachable() -> Bool {
        
        if Reachability.isConnectedToNetwork() == true {
            return true
        } else {
            return false
        }
        
    }

}



