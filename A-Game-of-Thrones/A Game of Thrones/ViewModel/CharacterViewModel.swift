//
//  CharacterViewModel.swift
//  A Game of Thrones
//
//  Created by Senthil on 10/09/23.
//

import UIKit


class CharacterViewModel {

    // Closure use for Notification
    var reloadList = {() -> () in }
    var errorMessage = {(message : String) -> () in }
    
    // Array of Detail Model class
    var characterDetailList : [DetailModel] = []{
        // Reload data when data set
        didSet{
            reloadList()
        }
    }
    
    
    //MARK: Character API
    func readBookCharacterInfoFromAPI(character_APIString:String!){
        
        if  NetworkManager.SharedInstance.isNetworkReachable() == false {
            
            AlertManager.SharedInstance.internetAlertwithImage()
            
        }else {
            guard let url = URL(string: character_APIString!) else {return}
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let dataResponse = data,
                    error == nil else {
                        print(error?.localizedDescription ?? "Response Error")
                        return }
                
                do{
                    //here dataResponse received from a network request
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                        dataResponse, options: []) as AnyObject
                    
                    guard let name = jsonResponse["name"] as? String else { return }
                    guard let gender = jsonResponse["gender"] as? String else { return }
                    guard let born = jsonResponse["born"] as? String else { return }
                    guard let culture = jsonResponse["culture"] as? String else { return }
                    guard let father = jsonResponse["father"] as? String else { return }
                    guard let mother = jsonResponse["mother"] as? String else { return }
                    guard let titles = jsonResponse["titles"] as? [String] else { return }
                    guard let aliases = jsonResponse["aliases"] as? [String] else { return }
                    guard let died = jsonResponse["died"] as? String else { return }
                    guard let playedBy = jsonResponse["playedBy"] as? [String] else { return }
                    
                    let detail = DetailModel(name: name, gender: gender, culture: culture, born: born, died: died, titles: titles, aliases: aliases, father: father, mother: mother, playedBy: playedBy)
                    self.characterDetailList.append(detail)

                } catch let parsingError {
                    print("Error", parsingError)
                }
                
            }
            
            task.resume()
        }
        
    }
    
}
