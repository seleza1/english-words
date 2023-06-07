//
//  WordMeaningViewController.swift
//  english-words
//
//  Created by user on 11.05.2023.
//

import UIKit
import AVFoundation

final class WordMeaningViewController: UIViewController {

    private var viewModel = WordMeaningViewModel()

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
        speakWord()
    }

    func update(with word: Int) {
        wordsView.configure(word)
    }
}

private extension WordMeaningViewController {
    func closeButton() {
        wordsView.onAction = { [weak self] in
            self?.dismiss(animated: true)
        }
    }

    func nextWords() {
        wordsView.onTappNextButtonWord = {
            print("next")
        }
    }

    func speakWord() {
        wordsView.onVoice = {
            guard let word = self.wordsView.stickerView.worldLabel.text else { return }

            let synthesizer = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: word)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")

            synthesizer.speak(utterance)
        }
    }
}

