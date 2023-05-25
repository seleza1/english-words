//
//  GameAssemler.swift
//  english-words
//
//  Created by Viktor Shabanov on 25/05/2023.
//

import UIKit

enum GameAssemler {
    
    static func buildModule() -> UIViewController {
        let viewModel = GameViewModel()
        let viewController = GameViewController(viewModel: viewModel)
        
        viewModel.viewController = viewController
        
        return viewController
    }
    
}
