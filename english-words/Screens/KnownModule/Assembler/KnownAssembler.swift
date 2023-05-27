//
//  KnownAssembler.swift
//  english-words
//
//  Created by user on 26.05.2023.
//

import UIKit

enum KnownAssembler {

    static func buildModule() -> UIViewController {
        let viewModel = KnowWordsViewModel()
        let viewController = KnownWordsViewController(viewModel: viewModel)

        viewModel.viewController = viewController

        return viewController
    }
}
