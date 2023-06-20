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

        allWords = wordsService.loadWords()
        
        allWords = allWords.filter { word in
            if word.status == .learned {
                return true
            } else {
                return false
            }
        }

        if currentIndex >= allWords.count {
             currentIndex = 0
         }

        let currentWord = allWords[currentIndex]

        viewController?.updateScreen(
            word: currentWord.word.capitalized,
            translation: currentWord.translate.capitalized
        )
        currentIndex += 1
    }
}
