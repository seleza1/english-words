//
//  KnownModuleAssembly.swift
//  english-words
//
//  Created by user on 26.05.2023.
//

import UIKit

enum KnownModuleAssembly {

    static func buildModule() -> UIViewController {
        let viewModel = KnownWordsViewModel()
        let viewController = KnownWordsViewController(viewModel: viewModel)

        viewModel.viewController = viewController

        return viewController
    }
}
