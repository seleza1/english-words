//
//  WordsService.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import Foundation

final class WordsService {

    static let shared = WordsService()

    private let loader = JSONLoader()
    private let archiver = WordsArchiver()

    private init() {
        var words = archiver.retrieve()

        if words.isEmpty {
            words = loader.loadWords(.words5000) ?? []
            archiver.save(words)
        }
    }

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

//
//class WordsService {
//
//    //MARK: - Public Properties
//
//    let jsonLoader = JSONLoader()
//
//    let allWordsArchiver = WordsArchiver()
//    let unknownWordsArchiver = WordsArchiver()
//    let knownWordsArchiver = WordsArchiver()
//
//    var allWords: [Word] = []
//}
//
////MARK: - Extension
//
//extension WordsService {
//
//    func fetchWords() {
//        let words = jsonLoader.loadWords(.words5000) ?? []
//        self.allWords = words.shuffled()
//    }
//
//    func next() -> WordModel {
//
//        let next = allWords.removeFirst()
//
//        var variants: [String] = Array(repeating: "", count: 4)
//        variants[0] = next.translate
//
//        for index in 1..<variants.count {
//            variants[index] = allWords.randomElement()?.translate ?? ""
//        }
//        variants.shuffle()
//
//        let wordModel = WordModel(
//            id: next.id,
//            word: next.word,
//            translate: next.translate,
//            variants: variants
//        )
//
//        return wordModel
//    }
//}
