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
    private var wordsNotStatus: [Word] = []
    private var index: Int = 0

    weak var viewController: GameViewController?

    var word: GameModel?

    
    // MARK: - Input
    
    func viewDidLoad() {
        displayNextWord()
    }

    func displayNextWord() {
        index += 1

        let word = next()

        viewController?.update(
            word: word,
            number: index,
            index: wordsNotStatus.count + 1
        )
    }


    func checkVariants(translations: String) -> Bool {

        if word?.variants[0] == translations {
            return false
        } else {
            return true
        }
    }
}

// MARK: - Methods

private extension GameViewModel {

    func next() -> GameModel {
        
        let words = wordsService.loadWords()
        allWords = words.shuffled()

        wordsNotStatus = allWords.filter { word in
            if word.status != .learned {
                return true
            } else {
                return false
            }
        }

        let next = wordsNotStatus.removeFirst()

        var variants: [String] = Array(repeating: "", count: 4)
        variants[0] = next.translate

        for index in 1..<variants.count {
            variants[index] = wordsNotStatus.randomElement()?.translate ?? ""
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
