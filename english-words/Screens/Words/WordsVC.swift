//
//  ViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class WordsVC: UIViewController {

    var viewModel = WordsViewModel()

    var wordsView: WordsView { return self.view as! WordsView }

    override func loadView() {
        self.view = WordsView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startLearnButtonTapped()
        presentWordMeaning()

        viewModel.onWordsChanged = { [weak self] words in
            self?.wordsView.update(words)
        }

        fetchWords()
    }
}

extension WordsVC {
    private func startLearnButtonTapped() {
        wordsView.startLearnButton.onAction = {
            let gameVC = GameVC()
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: true)
        }
    }

    private func presentWordMeaning() {
        wordsView.didTapped = { [weak self] meaning, translate in
            let wordMeaning = WordMeaningViewController()
            wordMeaning.wordLabelMeaning.text = meaning
            wordMeaning.wordLabelTranslate.text = translate
            wordMeaning.modalPresentationStyle = .fullScreen
            self?.present(wordMeaning, animated: true)

        }
    }

    private func fetchWords() {
        viewModel.fetchWords()
    }
}

