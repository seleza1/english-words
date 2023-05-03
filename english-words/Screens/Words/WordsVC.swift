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

        viewModel.onWordsChanged = { [weak self] words in
            self?.wordsView.update(words)
        }
        fetchWords()

    }
}

extension WordsVC {
    private func fetchWords() {
        viewModel.fetchWords()
    }
}

