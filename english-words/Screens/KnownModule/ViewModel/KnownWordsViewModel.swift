//
//  KnownWordsViewModel.swift
//  english-words
//
//  Created by user on 03.05.2023.
//

import Foundation

final class KnownWordsViewModel {

    // MARK: - Private

    private let wordsService = WordsService.shared
    private var allWords: [Word] = []

    private var knownView: KnownView?

    weak var viewController: KnownWordsViewController?
}

// MARK: - Methods

extension KnownWordsViewModel {

    func viewDidLoad() {
        allWords = wordsService.loadWords()

        let wordsLearned = allWords.filter { word in
            if word.status == .learned {
                return true
            } else {
                return false
            }
        }
        viewController?.update(with: wordsLearned)
    }

    func viewDidAppear() {
        allWords = wordsService.loadWords()

        let wordsLearned = allWords.filter { word in
            if word.status == .learned {
                return true
            } else {
                return false
            }
        }
        viewController?.update(with: wordsLearned)
    }
}
