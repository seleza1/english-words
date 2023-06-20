//
//  KnownModuleAssembly.swift
//  english-words
//
//  Created by user on 26.05.2023.
//

import UIKit

protocol KnownModuleAssemblyProtocol {
    static func buildModule() -> UIViewController
}

enum KnownModuleAssembly: KnownModuleAssemblyProtocol {

    static func buildModule() -> UIViewController {
        let viewModel = KnownWordsViewModel()
        let viewController = KnownWordsViewController(viewModel: viewModel)

        viewModel.viewController = viewController

        return viewController
    }
}
