//
//  WordMeaningModuleAssembly.swift
//  english-words
//
//  Created by user on 26.05.2023.
//

import UIKit

protocol WordMeaningModuleAssemblyProtocol {
    static func buildModule() -> UIViewController
}

enum WordMeaningModuleAssembly: WordMeaningModuleAssemblyProtocol {

    static func buildModule() -> UIViewController {
        let viewModel = WordMeaningViewModel()

        let viewController = WordMeaningViewController(viewModel: viewModel)

        viewModel.viewController = viewController

        return viewController
    }
}
