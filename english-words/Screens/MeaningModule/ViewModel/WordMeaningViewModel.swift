//
//  WordMeaningViewModel.swift
//  english-words
//
//  Created by user on 26.05.2023.
//

import UIKit

final class WordMeaningViewModel {

    // MARK: Private

    private let wordsService = WordsService.shared
    private var allWords: [Word] = []

    private var currentIndex = 0

    weak var viewController: WordMeaningViewController?
}

extension WordMeaningViewModel {
    func viewDidLoad() {
        nextWords()
    }

    func nextWords() {
        allWords = self.wordsService.loadWords()
        
        let wordsLearned = allWords.filter { word in
            if word.status == .learned {
                return true
            } else {
                return false
            }
        }

        let wordsCount = self.allWords[self.currentIndex]

        let stickerView = viewController?.wordsView.stickerView

        stickerView?.worldLabel.text = wordsCount.word.capitalized
        stickerView?.translationLabel.text = wordsCount.translate.capitalized
        self.currentIndex += 1

        viewController?.update(index: currentIndex, word: wordsLearned.count)
    }
}
