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
        self.view = KnownView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchWords()
        startLearnButtonTapped()
        update()
    }
}

// MARK: - Extension

private extension KnownWordsViewController {

    // MARK: - Private Methods

    func startLearnButtonTapped() {
        knowView.startLearnButton.onAction = {
            let gameVC = GameViewController()
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: true)
        }
    }

    func fetchWords() {
        viewModel.fetchWords()
    }

    func update() {
        viewModel.onWordsChanged = { [weak self] words in
            self?.knowView.update(words)
        }
    }
}
