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
    
    func update(with word: WordModel) {
        gameView.configure(word)
    }
}

// MARK: - Extension

private extension GameViewController {
    
    func setupActions() {
        gameView.oneTappCloseButton = { [ weak self ] in
            self?.dismiss(animated: true)
        }
        
        gameView.onVariantChanged = { [ weak self ] in
            self?.viewModel.displayNextWord()
        }
    }
}
