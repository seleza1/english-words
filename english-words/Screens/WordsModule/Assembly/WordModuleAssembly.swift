//
//  WordModuleAssembly.swift
//  english-words
//
//  Created by user on 26.05.2023.
//

import UIKit

enum WordModuleAssembly {

    static func buildModule() -> UIViewController {
        let viewModel = WordsViewModel()
        let viewController = WordsViewController(viewModel: viewModel)

        viewModel.viewController = viewController

        return viewController
    }
    
}
