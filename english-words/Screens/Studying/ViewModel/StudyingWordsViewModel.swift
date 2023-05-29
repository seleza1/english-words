//
//  StudyingWordsModel.swift
//  english-words
//
//  Created by user on 03.05.2023.
//

import Foundation

final class StudyingWordsModel {

    // MARK: - Private

    private let wordsService = WordsService()
    private let studyingView = StudyingView()

    // MARK: - Public

    weak var viewController: StudyingWordsViewController?

    var onWordsChanged: (([Word])->())?

    let jsonLoader = JSONLoader()
    let wordsArchiver = WordsArchiver()

}

// MARK: - Extension

extension StudyingWordsModel {

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
        update()
    }

    func update() {
        onWordsChanged = { [ weak self ] words in
            self?.studyingView.update(words)
        }
    }
}
