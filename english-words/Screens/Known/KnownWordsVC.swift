//
//  KnowWordsViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class KnownWordsViewController: UIViewController {

    var knowView: KnownView { return self.view as! KnownView }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWords()

        knowView.startLearnButton.onAction = {
            let gameVC = GameViewController()
            self.modalPresentationStyle = .overFullScreen
            self.present(gameVC, animated: true)
        }

    }

    override func loadView() {
        self.view = KnownView(frame: UIScreen.main.bounds)

    }

    private func fetchWords() {
        if let loadedWords = JsonLoader().loadProducts(filename: "words5000") {
            let words = loadedWords.shuffled()

            knowView.update(words)
        }
    }
}
