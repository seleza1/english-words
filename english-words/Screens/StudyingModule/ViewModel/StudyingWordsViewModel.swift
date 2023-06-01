//
//  StudyingWordsModel.swift
//  english-words
//
//  Created by user on 03.05.2023.
//

import Foundation

final class StudyingWordsModel {

    private let wordsService = WordsService.shared
    private let studyingView = StudyingView()

    weak var viewController: StudyingWordsViewController?
}

extension StudyingWordsModel {

    func viewDidLoad() {
        let words = wordsService.loadWords()
        
        for word in words {
            if word.status == .learning {
                viewController?.update(with: [word])
                wordsService.save(word: word)
            }
        }
    }
}
