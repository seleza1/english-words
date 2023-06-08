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
    private var allWords: [Word] = []

    weak var viewController: StudyingWordsViewController?
}

// MARK: - Methods

extension StudyingWordsViewModel {

    func viewDidLoad() {
        allWords = wordsService.loadWords()

        let wordsStudying = allWords.filter { word in
            if word.status == .learning {
                return true
            } else {
                return false
            }
        }
        viewController?.update(with: wordsStudying)
    }

    func viewDidAppear() {
        allWords = wordsService.loadWords()

        let wordsStudying = allWords.filter { word in
            if word.status == .learning {
                return true
            } else {
                return false
            }
        }
        viewController?.update(with: wordsStudying)

        let studyingView = viewController?.studyingView

        if wordsStudying.count == 0 {
            studyingView?.continueToLearnButton.isHidden = true
        } else {
            studyingView?.continueToLearnButton.isHidden = false
        }
    }
}
