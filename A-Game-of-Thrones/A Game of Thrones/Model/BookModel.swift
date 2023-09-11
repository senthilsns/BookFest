//
//  BookModel.swift
//  A Game of Thrones
//
//  Created by Senthil on 10/09/23.
//


import UIKit

class BookModel: Codable {
    
    var url: String?
    var name: String?
    var authors: [String]?
    var isbn: String?
    var numberOfPages: Int?
    var publisher: String?
    var country: String?
    var mediaType: String?
    var released: String?
    var characters: [String]?
    var povCharacters: [String]?
    
    enum CodingKeys: String, CodingKey {
        case url
        case name
        case authors
        case isbn
        case numberOfPages
        case publisher
        case country
        case mediaType
        case released
        case characters
        case povCharacters
    }
}
