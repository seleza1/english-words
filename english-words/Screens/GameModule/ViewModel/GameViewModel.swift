//
//  GameViewModel.swift
//  english-words
//
//  Created by user on 25/05/2023.
//

import Foundation

final class GameViewModel {

    // MARK: - Private
    
    private let wordsService = WordsService.shared
    private var allWords: [Word] = []
    private var index: Int = -1

    // MARK: - Public

    weak var viewController: GameViewController?

    // MARK: - Input
    
    func viewDidLoad() {

        allWords = wordsService.loadWords()

        allWords = allWords.filter { word in
            if word.status == .none || word.status == .learning {
                return true
            } else {
                return false
            }
        }

        displayNextWord()
    }

    func displayNextWord() {
        index += 1

        let word = next()

        viewController?.update(
            word: word,
            number: index+1,
            index: allWords.count
        )
    }

    func updateStatus(id: Int, status: Word.Status) {
        for allWord in allWords {
            if allWord.id == id {
                var word = allWord
                word.status = status
                wordsService.save(word: word)
                break
            }
        }
    }
}

// MARK: - Private Methods

private extension GameViewModel {

    func next() -> GameModel {

        let next = allWords[index]

        var variants: [String] = Array(repeating: "", count: 4)
        variants[0] = next.translate

        for index in 1..<variants.count {
            variants[index] = allWords.randomElement()?.translate ?? ""
        }
        variants.shuffle()

        let gameModel = GameModel(
            id: next.id,
            word: next.word,
            translate: next.translate,
            variants: variants
        )

        return gameModel
    }
}
