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

        for word in words {
            if word.status == .learned {
                viewController?.update(with: [word])
                wordsService.save(word: word)
            }
        }
    }
}
