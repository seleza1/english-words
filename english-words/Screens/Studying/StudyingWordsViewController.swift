//
//  StudyingViewController.swift
//  english-words
//
//  Created by user on 13.04.2023.
//

import UIKit

final class StudyingWordsViewController: UIViewController {

    var viewModel = StudyingWordsModel()
    var studyingView: StudyingView { return self.view as! StudyingView }

    // MARK: - Lifecycle

    override func loadView() {
        
        self.view = StudyingView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLearnButtonTapped()
        didChange()
        fetchWords()
    }
}

// MARK: - Extension

private extension StudyingWordsViewController {

    func startLearnButtonTapped() {
        studyingView.oneTapLearnButton = {
            let gameVC = GameViewController()
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: true)
        }
    }

    func fetchWords() {
        viewModel.fetchWords()
    }

    func didChange() {
        viewModel.onWordsChanged = { [weak self] words in
            self?.studyingView.update(words)
        }
    }
}
