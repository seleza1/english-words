//
//  WordsService.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import Foundation

final class WordsService {

    private let loader = JSONLoader()
    private let archiver = WordsArchiver()

    private init() {
        var words = archiver.retrieve()

        if words.isEmpty {
            words = loader.loadWords(.words5000) ?? []
            archiver.save(words)
        }
    }

    static let shared = WordsService()

    var allWords: [Word] = []

    func loadWords() -> [Word] {
        archiver.retrieve()
    }

    func save(word: Word) {
        var words = archiver.retrieve()

        let index = words.firstIndex { oldWords in
            oldWords.id == word.id
        }

        if let index = index {
            words[index] = word
            archiver.save(words)
        }
    }
}

extension WordsService {

    func next() -> GameModel {

        let words = loadWords()
        allWords = words
        
        let next = allWords.removeFirst()

        var variants: [String] = Array(repeating: "", count: 4)
        variants[0] = next.translate

        for index in 1..<variants.count {
            variants[index] = allWords.randomElement()?.translate ?? ""
        }
        variants.shuffle()

        let wordModel = GameModel(
            id: next.id,
            word: next.word,
            translate: next.translate,
            variants: variants
        )

        return wordModel
    }
}
