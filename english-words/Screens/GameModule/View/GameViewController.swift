//
//  GameViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class GameViewController: UIViewController {

    private let viewModel: GameViewModel
    
    private var gameView: GameView {
        self.view as! GameView
    }

    var word: GameModel?

    
    // MARK: - Interface

    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = GameView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActions()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Input
    
    func update(word: GameModel, number: Int, index: Int) {
        gameView.configure(
            word: word,
            number: number,
            index: index
        )
    }
}

// MARK: - Extension

private extension GameViewController {
    
    func setupActions() {
        gameView.oneTappCloseButton = { [weak self] in
            self?.dismiss(animated: true)
        }
        
        gameView.onVariantChanged = { [weak self] in
            self?.viewModel.displayNextWord()
        }

        gameView.updateWord = { [weak self] id, status in
            self?.viewModel.updateStatus(id: id, status: status)
        }
    }
}
