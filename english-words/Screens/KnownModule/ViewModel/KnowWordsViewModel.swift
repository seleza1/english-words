//
//  KnowWordsViewModel.swift
//  english-words
//
//  Created by user on 03.05.2023.
//

import Foundation

final class KnowWordsViewModel {

    // MARK: - Private

    private let wordsService = WordsService()

    // MARK: - Public

    weak var viewController: KnownWordsViewController?

    var onWordsChanged: (([Word])->())?

    let jsonLoader = JSONLoader()
    let wordsArchiver = WordsArchiver()

}

// MARK: - Extension

extension KnowWordsViewModel {

    func fetchWords() {
        let archivedWords = wordsArchiver.retrieve()

        if archivedWords.isNotEmpty {
            onWordsChanged?(archivedWords)
            return
        }

        if let loadedWords = jsonLoader.loadWords(.words5000) {
            let words = loadedWords.shuffled()
            onWordsChanged?(words)
        }
    }

    func viewDidLoad() {
        wordsService.fetchWords()
    }
}
