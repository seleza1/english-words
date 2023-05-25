//
//  WordTableViewCellModel.swift
//  english-words
//
//  Created by user on 20.05.2023.
//

import Foundation

struct WordTableViewCellModel {

    let word: String
    var isLearned: Bool? = nil

    init(word: String, isLearned: Bool?) {
        self.word = word
        self.isLearned = isLearned
    }
}


