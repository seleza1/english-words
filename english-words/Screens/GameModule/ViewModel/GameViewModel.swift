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
    private let voiceService = VoiceService.shared

    private var allWords: [Word] = []
    private var index: Int = 0

    // MARK: - Public

    weak var viewController: GameViewController?

    // MARK: - Input
    
    func viewDidLoad() {
        allWords = wordsService.loadWords()

        allWords = allWords.filter { $0.status == .learning || $0.status == .none }

        displayNextWord()
    }

    func displayNextWord() {
        viewController?.update(
            word: next(),
            number: index + 1,
            index: allWords.count
        )
    }

    func didSelect(variant: String) {
        var currentWord = allWords[index]
        let isCorrect = currentWord.translate == variant

        viewController?.display(variant: variant, as: isCorrect)

        currentWord.status = isCorrect ? .learned : .learning
        wordsService.save(word: currentWord)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.index += 1
            self?.displayNextWord()
        }
    }

    func hintTap() {
        let currentWord = allWords[index]

        viewController?.displayHint(word: currentWord.translate)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) { [weak self] in
            self?.index += 1
            self?.displayNextWord()
        }
    }

    func voiceTap() {
        let currentWord = allWords[index]

        voiceService.speakWord(word: currentWord.word)
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
