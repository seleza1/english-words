//
//  WordsViewModel.swift
//  english-words
//
//  Created by user on 03.05.2023.
//

import Foundation

final class WordsViewModel {

    // MARK: - Private

    private let wordService = WordsService.shared
    private var allWords: [Word] = []

    weak var viewController: WordsViewController?
}

// MARK: - Methods

extension WordsViewModel {

    func viewDidLoad() {
        allWords = wordService.loadWords()
        viewController?.update(with: allWords)
    }

    func viewWillAppear() {
        allWords = wordService.loadWords()
        viewController?.update(with: allWords)
    }
}
