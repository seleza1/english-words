//
//  StudyingWordsViewModel.swift
//  english-words
//
//  Created by user on 03.05.2023.
//

import Foundation

final class StudyingWordsViewModel {

    // MARK: - Private

    private let wordsService = WordsService.shared
    private var wordsStudying: [Word] = []

    weak var viewController: StudyingWordsViewController?
}

// MARK: - Methods

extension StudyingWordsViewModel {

    func viewDidLoad() {
        wordsStudying = wordsService.loadWords()

        wordsStudying = wordsStudying.filter { word in
            if word.status == .learning {
                return true
            } else {
                return false
            }
        }
        viewController?.update(with: wordsStudying)
    }

    func viewDidAppear() {
        wordsStudying = wordsService.loadWords()

        wordsStudying = wordsStudying.filter { word in
            if word.status == .learning {
                return true
            } else {
                return false
            }
        }
        viewController?.update(with: wordsStudying)
    }
}
 
