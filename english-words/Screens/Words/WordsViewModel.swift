//
//  WordsViewModel.swift
//  english-words
//
//  Created by user on 03.05.2023.
//

import Foundation


final class WordsViewModel {

    var onWordsChanged: (([Word])->())?

    let jsonLoader = JsonLoader()
    let wordsArchiver = WordsArchiver(type: .all)

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
}
