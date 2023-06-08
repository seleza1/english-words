//
//  ViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class WordsViewController: UIViewController {

    // MARK: - Private

    private var viewModel = WordsViewModel()

    private var wordsView: WordsView {
        self.view as! WordsView
    }

    init(viewModel: WordsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        self.view = WordsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupActions()
        viewModel.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
    }

    func update(with word: [Word]) {
        wordsView.configure(word)
    }
}

// MARK: - Extension

private extension WordsViewController {

    func setupActions() {
        wordsView.oneTapLearnButton = {
            let controller = GameAssembler.buildModule()
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true)
        }
    }
}

