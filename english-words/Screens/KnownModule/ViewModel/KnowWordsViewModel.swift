//
//  KnowWordsViewModel.swift
//  english-words
//
//  Created by user on 03.05.2023.
//

import Foundation

final class KnowWordsViewModel {

    private let wordsService = WordsService.shared

    weak var viewController: KnownWordsViewController?
}

extension KnowWordsViewModel {

    func viewDidLoad() {
        let words = wordsService.loadWords()

        let wordsLearned = words.filter { word in
            if word.status == .learned {

                return true
            } else {
                return false
            }
        }
        viewController?.update(with: wordsLearned)
    }
}
