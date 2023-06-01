//
//  WordsViewModel.swift
//  english-words
//
//  Created by user on 03.05.2023.
//

import Foundation

final class WordsViewModel {

    private let wordService = WordsService.shared

    weak var viewController: WordsViewController?
}

extension WordsViewModel {

    func viewDidLoad() {
        let words = wordService.loadWords()

        viewController?.update(with: words)
    }
}
