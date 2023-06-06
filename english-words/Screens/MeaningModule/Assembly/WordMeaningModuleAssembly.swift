//
//  WordMeaningModuleAssembly.swift
//  english-words
//
//  Created by user on 26.05.2023.
//

import UIKit

enum WordMeaningModuleAssembly {

    static func buildModule() -> UIViewController {
        let viewModel = WordMeaningViewModel()

        let viewController = WordMeaningViewController(viewModel: viewModel)

        viewModel.viewController = viewController

        return viewController
    }
}
