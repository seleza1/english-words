//
//  WordsService.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import Foundation

class WordsService {

    //MARK: - Public Properties

    let jsonLoader = JsonLoader()

    let allWordsArchiver = WordsArchiver(type: .all)
    let unknownWordsArchiver = WordsArchiver(type: .unknown)
    let knownWordsArchiver = WordsArchiver(type: .known)

    var allWords: [Word] = []
}

//MARK: - Extension

extension WordsService {

    //MARK: - Public Methods

    func fetchWords() {
        let words = jsonLoader.loadProducts(.words5000) ?? []
        self.allWords = words.shuffled()
    }

    func next() -> WordModel {

        let next = allWords.removeFirst()

        var variants: [String] = Array(repeating: "", count: 4)
        variants[0] = next.translate

        for index in 1..<variants.count {
            variants[index] = allWords.randomElement()?.translate ?? ""
        }
        variants.shuffle()

        let wordModel = WordModel(
            id: next.id,
            word: next.word,
            translate: next.translate,
            variants: variants
        )

        return wordModel
    }
}
