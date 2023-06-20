//
//  StudyingModuleAssembly.swift
//  english-words
//
//  Created by user on 26.05.2023.
//

import UIKit

protocol StudyingModuleAssemblyProtocol {
    static func buildModule() -> UIViewController
}

enum StudyingModuleAssembly: StudyingModuleAssemblyProtocol {

    static func buildModule() -> UIViewController {
        let viewModel = StudyingWordsViewModel()
        let viewController = StudyingWordsViewController(viewModel: viewModel)

        viewModel.viewController = viewController

        return viewController
    }
}
