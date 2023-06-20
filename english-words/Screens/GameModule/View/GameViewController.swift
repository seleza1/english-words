//
//  GameViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class GameViewController: UIViewController {

    // MARK: - Private

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
    
    func update(word: GameModel, number: Int, index: Int) {
        gameView.isUserInteractionEnabled = true
        gameView.configure(
            word: word,
            number: number,
            index: index
        )
    }

    func display(variant: String, as correct: Bool) {
        gameView.isUserInteractionEnabled = false
        gameView.display(word: variant, as: correct)
    }

    func displayHint(word: String) {
        gameView.isUserInteractionEnabled = false
        gameView.displayHint(variant: word)
    }
}

// MARK: - Private Methods

private extension GameViewController {
    
    func setupActions() {
        gameView.oneTapCloseButton = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        gameView.onVariantChanged = { [weak self] in
            self?.viewModel.displayNextWord()
        }

        gameView.onSelectVariant = { [weak self] variant in
            self?.viewModel.didSelect(variant: variant)
        }

        gameView.onTapHint = { [weak self] in
            self?.viewModel.hintTap()
        }

        gameView.onTapVoice = { [weak self] in
            self?.viewModel.voiceTap()
        }
    }
}
