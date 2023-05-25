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

    func startLearnButtonTapped() {
        wordsView.oneTapLearnButton = {
            let controller = GameAssemler.buildModule()
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true)
        }
    }

    func presentWordMeaning() {
        wordsView.didTapped = { [weak self] meaning, translate in
            let wordMeaning = WordMeaningViewController()
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

