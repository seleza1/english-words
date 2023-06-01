//
//  StudyingWordsViewModel.swift
//  english-words
//
//  Created by user on 03.05.2023.
//

import Foundation

final class StudyingWordsViewModel {

    private let wordsService = WordsService.shared
    private let studyingView = StudyingView()

    weak var viewController: StudyingWordsViewController?
}

extension StudyingWordsViewModel {

    func viewDidLoad() {
        let words = wordsService.loadWords()

        let wordsStudying = words.filter { word in
            if word.status == .learning {
                return true
            } else {
                return false
            }
        }
        viewController?.update(with: wordsStudying)
    }
}
