//
//  KnowWordsViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

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
            let gameVC = GameVC()
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: true)
        }
    }

    private func fetchWords() {
        viewModel.fetchWords()
    }
}
