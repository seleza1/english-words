//
//  KnowWordsViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class KnownWordsViewController: UIViewController {

    var knowView: KnownView { return self.view as! KnownView }
    let viewModel = KnowWordsViewModel()

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        
        self.view = KnownView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchWords()
        update()
        present()
    }
}

// MARK: - Extension

private extension KnownWordsViewController {

    func fetchWords() {
        viewModel.fetchWords()
    }

    func present() {
//        knowView.didTappedCell = { word, translate in
//            let wordMeaning = WordMeaningViewController()
//            wordMeaning.wordLabel.text = word.capitalized
//            wordMeaning.translateLabel.text = translate.capitalized
//            wordMeaning.modalPresentationStyle = .fullScreen
//            self.present(wordMeaning, animated: true)
//        }
    }

    func update() {
        viewModel.onWordsChanged = { [weak self] words in
            self?.knowView.update(words)
        }
    }
}
