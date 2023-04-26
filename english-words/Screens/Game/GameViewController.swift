//
//  GameViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class GameViewController: UIViewController {

    private var total: Float = 0

    var gameView: GameView { return self.view as! GameView }

    override func loadView() {
        self.view = GameView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateProgress()
        closeView()

    }

    private func closeView() {
        gameView.closeButton.onAction = {
            self.dismiss(animated: true)

        }
    }

    private func updateProgress() {
        gameView.oneButton.onAction = {
            self.total += 0.25
            self.gameView.progressView.setProgress((self.total), animated: true)

            if self.total == 1 {
                self.dismiss(animated: true)
            }
        }
    }


}


