//
//  WordsViewModel.swift
//  english-words
//
//  Created by user on 03.05.2023.
//

import Foundation

final class WordsViewModel {

    // MARK: - Private

    private let wordService = WordsService()
    private let wordsView = WordsView()

    // MARK: - Public

    weak var viewController: WordsViewController?

    var onWordsChanged: (([Word])->())?

    let jsonLoader = JsonLoader()
    let wordsArchiver = WordsArchiver(type: .all)
}

// MARK: - Extension

extension WordsViewModel {

    func fetchWords() {
        let archivedWords = wordsArchiver.retrieve()

        if archivedWords.isNotEmpty {
            onWordsChanged?(archivedWords)

            return
        }

        if let loadedWords = jsonLoader.loadProducts(.words5000) {
            let words = loadedWords.shuffled()
            onWordsChanged?(words)
        }
    }

    func viewDidLoad() {
        wordService.fetchWords()
        didChange()
    }

    func didChange() {
        onWordsChanged = { [ weak self ] words in
            self?.wordsView.update(words)
        }
    }
}
