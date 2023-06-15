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
    private var wordsLearned: [Word] = []

    weak var viewController: KnownWordsViewController?
}

// MARK: - Methods

extension KnownWordsViewModel {

    func viewDidLoad() {
        wordsLearned = wordsService.loadWords()

        wordsLearned = wordsLearned.filter { word in
            if word.status == .learned {
                return true
            } else {
                return false
            }
        }
        viewController?.update(with: wordsLearned)
    }

    func viewDidAppear() {
        wordsLearned = wordsService.loadWords()

        wordsLearned = wordsLearned.filter { word in
            if word.status == .learned {
                return true
            } else {
                return false
            }
        }
        viewController?.update(with: wordsLearned)
    }
}
