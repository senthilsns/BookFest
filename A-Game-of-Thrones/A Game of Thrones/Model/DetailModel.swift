//
//  DetailModel.swift
//  A Game of Thrones
//
//  Created by Senthil on 10/09/23.
//

import UIKit

struct DetailModel {
    
    var name: String?
    var gender: String?
    var culture: String?
    var born: String?
    var died: String?
    var titles: [String]?
    var aliases: [String]?
    var father: String?
    var mother: String?
    var playedBy: [String]?
    
    init(name:String,gender:String,culture:String,born:String,died:String,titles:[String],aliases:[String],father:String,mother:String,playedBy:[String]) {
        
        self.name = name
        self.gender = gender
        self.culture = culture
        self.born = born
        self.died = died
        self.titles = titles
        self.aliases = aliases
        self.father = father
        self.mother = mother
        self.playedBy = playedBy
        
    }

}
