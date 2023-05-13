//
//  GameViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class GameVC: UIViewController {

    private var total: Float = 0

    var wordsService = WordsService()
    var word: WordModel?
    var gameView: GameView { return self.view as! GameView }

    override func loadView() {
        self.view = GameView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateProgress()
        closeView()
        wordsService.fetchWords()
        let next = wordsService.next()
        gameView.update(next)
    }
}

extension GameVC {
    private func closeView() {
        gameView.closeButton.onAction = {
            self.dismiss(animated: true)
        }
    }

    private func updateProgress() {

        gameView.onVariantChanged = {
            let next  = self.wordsService.next()
            self.gameView.update(next)
        }
    }
}


