//
//  StudyingModuleAssembly.swift
//  english-words
//
//  Created by user on 26.05.2023.
//

import UIKit

enum StudyingModuleAssembly {

    static func buildModule() -> UIViewController {
        let viewModel = StudyingWordsModel()
        let viewController = StudyingWordsViewController(viewModel: viewModel)

        viewModel.viewController = viewController

        return viewController
    }
}
