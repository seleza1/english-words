//
//  WordsService.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import Foundation

class WordsService {
    let words = [
        Word.init(word: "cat", translate: "кот"),
        Word.init(word: "human", translate: "человек")
    ]

    func fetchWords() -> [Word] {
        return words
    }
}
