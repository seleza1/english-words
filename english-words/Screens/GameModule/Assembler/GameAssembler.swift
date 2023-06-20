//
//  GameAssembler.swift
//  english-words
//
//  Created by user on 25/05/2023.
//

import UIKit

protocol GameAssemblerProtocol {
    static func buildModule() -> UIViewController
}

enum GameAssembler: GameAssemblerProtocol {
    
    static func buildModule() -> UIViewController {
        let viewModel = GameViewModel()
        let viewController = GameViewController(viewModel: viewModel)
        
        viewModel.viewController = viewController
        
        return viewController
    }
}
