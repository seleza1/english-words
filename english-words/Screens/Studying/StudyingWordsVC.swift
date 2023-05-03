//
//  StudyingViewController.swift
//  english-words
//
//  Created by user on 13.04.2023.
//

import UIKit

/*
 Responsibilities:
 1. Business Logic (api, db, location, blte)
 2. Event Handling
 3. Navigation
 */

final class StudyingWordsModel {

    var onWordsChanged: (([Word])->())?
    
    let jsonLoader = JsonLoader()
    let wordsArchiver = WordsArchiver(type: .all)

    func fetchWords() {

        let archivedWords = wordsArchiver.retrieve()

        if archivedWords.isNotEmpty {
            //self.words = archivedWords
            onWordsChanged?(archivedWords)
            return
        }

        if let loadedWords = jsonLoader.loadProducts(.words5000) {
            let words = loadedWords.shuffled()

            onWordsChanged?(words)
        }
    }
}

final class StudyingWordsVC: UIViewController {

    var viewModel = StudyingWordsModel()
    
    var studyingView: StudyingView { return self.view as! StudyingView }

    override func loadView() {
        self.view = StudyingView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        startLearnButtonTapped()

        viewModel.onWordsChanged = { [weak self] words in
            self?.studyingView.update(words)
        }
        fetchWords()
    }
}

extension StudyingWordsVC {
    private func startLearnButtonTapped() {
        
        studyingView.startLearnButton.onAction = {
            let gameVC = GameVC()
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: true)
        }
    }

    private func fetchWords() {
        viewModel.fetchWords()
    }
}
