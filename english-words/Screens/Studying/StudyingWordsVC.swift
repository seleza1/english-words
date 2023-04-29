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
    
    let wordsService = WordsService()
    let jsonLoader = JsonLoader()

    func fetchWords() {
        if let loadedWords = jsonLoader.loadProducts(filename: "words5000") {
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


        viewModel.onWordsChanged = { [weak self] words in
            self?.studyingView.update(words)
            
        }

        fetchWords()

        studyingView.startLearnButton.onAction = {
            let gameVC = GameViewController()
            self.modalPresentationStyle = .overFullScreen
            self.present(gameVC, animated: true)
        }
    }

    private func fetchWords() {
        viewModel.fetchWords()
    }
}
