//
//  WordMeaningViewController.swift
//  english-words
//
//  Created by user on 11.05.2023.
//

import UIKit

final class WordMeaningViewController: UIViewController {

    private let viewModel: WordMeaningViewModel

    private var wordsView: WordMeaningView {
        self.view as! WordMeaningView
    }

    private let wordsService = WordsService.shared

    private var allWords: [Word] = []

    init(viewModel: WordMeaningViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = WordMeaningView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
        closeButton()
        nextWords()
        //speakWord()
    }

    func update(index: Int, words: Int) {
        wordsView.configure(index: index, words: words)
    }

    func updateScreent(word: String, translation: String) {
        wordsView.configureScreen(word: word, translate: translation)
    }
}

private extension WordMeaningViewController {
    func closeButton() {
        wordsView.onActionClose = { [weak self] in
            self?.dismiss(animated: true)
        }
    }

    func nextWords() {
        wordsView.onTappNextButtonWord = { [weak self] in
            self?.viewModel.nextWords()
        }
    }
}
