//
//  Words.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import Foundation

// MARK: - WordModel

struct WordModel {
    var id: Int
    var word: String
    var translate: String
    var variants: [String]
}

// MARK: - Word

struct Word: Codable {
    let id: Int
    let word: String
    let translate: String
}
