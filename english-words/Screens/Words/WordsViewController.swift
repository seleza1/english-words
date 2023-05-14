//
//  ViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class WordsViewController: UIViewController {

    // MARK: - Public Properties

    var viewModel = WordsViewModel()
    var wordsView: WordsView { return self.view as! WordsView }

    // MARK: - Lifecycle

    override func loadView() {
        self.view = WordsView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        startLearnButtonTapped()
        presentWordMeaning()
        didChange()
        fetchWords()
    }
}

// MARK: - Extension

private extension WordsViewController {

    // MARK: - Private Methods

    func startLearnButtonTapped() {
        wordsView.startLearnButton.onAction = {
            let gameVC = GameViewController()
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: true)
        }
    }

    func presentWordMeaning() {
        wordsView.didTapped = { [weak self] meaning, translate in
            let wordMeaning = WordMeaningViewController()
            wordMeaning.wordLabelMeaning.text = meaning
            wordMeaning.wordLabelTranslate.text = translate
            wordMeaning.modalPresentationStyle = .fullScreen
            self?.present(wordMeaning, animated: true)
        }
    }

    func fetchWords() {
        viewModel.fetchWords()
    }

    func didChange() {
        viewModel.onWordsChanged = { [weak self] words in
            self?.wordsView.update(words)
        }
    }
}

