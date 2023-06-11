//
//  GameViewModel.swift
//  english-words
//
//  Created by user on 25/05/2023.
//

import Foundation
import AVFAudio

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

    func updateVoice(word: String) {
        viewController?.gameView.stickerView.onVoice = {
            let synthesizer = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: word)
            utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.eloquence.en-US.Eddy")
            synthesizer.speak(utterance)
        }
    }

    func updateHint() {
        viewController?.gameView.stickerView.onHint = { [weak self] in
            let word = self?.viewController?.gameView.word

            if word?.variants[0] == word?.translate {
                self?.showHints(button: (self?.viewController?.gameView.variantButtons[0])!)
            } else if word?.variants[1] == word?.translate {
                self?.showHints(button: (self?.viewController?.gameView.variantButtons[1])!)
            } else if word?.variants[2] == word?.translate {
                self?.showHints(button: (self?.viewController?.gameView.variantButtons[2])!)
            } else if word?.variants[3] == word?.translate {
                self?.showHints(button: (self?.viewController?.gameView.variantButtons[3])!)
            }
        }
    }

    func showHints(button: VariantButton) {
        button.variantState = .right

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            button.variantState = .unknown
            self.viewController?.gameView.onVariantChanged?()
        }
    }

    func updateActions(button: VariantButton, index: Int) {
        button.onAction = { [weak self] in

            let word = self?.viewController?.gameView.word

            if word?.variants[index] == word?.translate {
                button.variantState = .right
                if let word = self?.viewController?.gameView.word {
                    self?.updateStatus(id: word.id, status: .learned)
                }
            } else {
                button.variantState = .wrong
                if let word = word {
                    self?.updateStatus(id: word.id, status: .learning)
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                button.variantState = .unknown
                self?.viewController?.gameView.onVariantChanged?()
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
