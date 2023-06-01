//
//  GameViewModel.swift
//  english-words
//
//  Created by user on 25/05/2023.
//

import Foundation

final class GameViewModel {
    
    private let wordsService = WordsService.shared
    
    weak var viewController: GameViewController?
    
    // MARK: - Input
    
    func viewDidLoad() {
        //displayNextWord()
    }

    func displayNextWord() {
        //let word = wordsService.next()
        //viewController?.update(with: word)
    }
}
