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

    weak var viewController: WordMeaningViewController?
}

extension WordMeaningViewModel {
    func viewDidLoad() {
        allWords = wordsService.loadWords()

        let wordsLearned = allWords.filter { word in
            if word.status == .learned {
                return true
            } else {
                return false
            }
        }
        viewController?.update(with: wordsLearned.count)
    }
}
