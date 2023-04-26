//
//  Words.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import Foundation

struct Word: Decodable, Encodable {
    let word: String
    let translate: String
}
