//
//  Words.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import Foundation

struct WordModel {
    var id: Int
    var word: String
    var translate: String
    var variants: [String]
}

extension Word {
    
    enum Status: String, Codable {
        
        case learning
        case learned
        
    }
}

struct Word: Codable {
    
    let id: Int
    let word: String
    let translate: String
    
    var status: Status?
}
