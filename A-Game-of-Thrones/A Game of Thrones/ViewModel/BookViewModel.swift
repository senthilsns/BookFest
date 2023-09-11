//
//  BookViewModel.swift
//  A Game of Thrones
//
//  Created by Senthil on 10/09/23.
//


import UIKit

class BookViewModel {

    // Closure use for Notification
    var reloadList = {() -> () in }
    var errorMessage = {(message : String) -> () in }
    
    // Array of BookModel class
    var arrayOfList : [BookModel] = []{
        // Reload data when data set
        didSet{
            reloadList()
        }
    }
    

   //MARK: Book API
    func readBookInfoFromAPI(){
        
        if  NetworkManager.SharedInstance.isNetworkReachable() == false {
            
            AlertManager.SharedInstance.internetAlertwithImage()
            
        } else {
        
        guard let url = URL(string: kBASE_URL+kBOOK_Home) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            
            do {
                let decoder = JSONDecoder()
                self.arrayOfList = try decoder.decode([BookModel].self, from: dataResponse )
                            }catch {
                                //Handle error
                                print("Error")
                            }
                        }
        task.resume()
    }
  }
}
