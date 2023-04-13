//
//  Words.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import Foundation

struct Word: Decodable {
    let word: String
    let phrase: String
    let translate: String
}
