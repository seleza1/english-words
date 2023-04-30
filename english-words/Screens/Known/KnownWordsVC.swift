//
//  KnowWordsViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class KnowWordsViewModel {
    var onWordsChanged: (([Word])->())?

    let jsonLoader = JsonLoader()
    let wordsArchiver = WordsArchiver()

    func fetchWords() {

        let archivedWords = wordsArchiver.retrieve()

        if archivedWords.isNotEmpty {
            //self.words = archivedWords
            onWordsChanged?(archivedWords)
            return
        }

        if let loadedWords = jsonLoader.loadProducts(filename: "words5000") {
            let words = loadedWords.shuffled()

            onWordsChanged?(words)
        }
    }

}

final class KnownWordsVC: UIViewController {

    var knowView: KnownView { return self.view as! KnownView }
    let viewModel = KnowWordsViewModel()

    override func loadView() {
        self.view = KnownView(frame: UIScreen.main.bounds)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWords()
        startLearnButtonTapped()

        viewModel.onWordsChanged = { [weak self] words in
            self?.knowView.update(words)
        }
    }
}

extension KnownWordsVC {
    private func startLearnButtonTapped() {
        knowView.startLearnButton.onAction = {
            let gameVC = GameViewController()
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: true)
        }
    }

    private func fetchWords() {
        viewModel.fetchWords()
    }
}
