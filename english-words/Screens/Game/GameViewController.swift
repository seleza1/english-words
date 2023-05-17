//
//  GameViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class GameViewController: UIViewController {

    // MARK: - Public Properties

    var wordsService = WordsService()
    var word: WordModel?
    var gameView: GameView { return self.view as! GameView }

    // MARK: - Lifecycle

    override func loadView() {
        self.view = GameView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateProgress()
        closeView()
        wordsService.fetchWords()
        update()
        hintTapped()
        soundTapped()
    }
}

// MARK: - Extension

private extension GameViewController {

    func closeView() {
        gameView.closeButton.onAction = {
            self.dismiss(animated: true)
        }
    }

    func hintTapped() {
        gameView.hintButton.onAction = {
            print("hint")
        }
    }

    func soundTapped() {
        gameView.soundButton.onAction = {
            print("sound")
        }
    }

    func updateProgress() {
        gameView.onVariantChanged = {
            let next  = self.wordsService.next()
            self.gameView.update(next)
        }
    }

    func update() {
        let next = wordsService.next()
        gameView.update(next)
    }
}


