//
//  MainTabBarController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

private extension MainTabBarController {

    func setupView() {
        let wordsController = WordModuleAssembly.buildModule()
        wordsController.tabBarItem = UITabBarItem(
            title: .dictionary,
            image: .booksImage,
            selectedImage: .booksSelectedImage
        )

        let studyingWordsController = StudyingModuleAssembly.buildModule()
        studyingWordsController.tabBarItem = UITabBarItem(
            title: .tableViewLearnButtonTitle,
            image: .coffeeImage,
            selectedImage: .coffeeSelectedImage
        )

        let knownWordsController = KnownModuleAssembly.buildModule()
        knownWordsController.tabBarItem = UITabBarItem(
            title: .tableViewKnownButtonTitle,
            image: .smileImage,
            selectedImage: .smileSelectedImage
        )

        tabBar.tintColor = .designSystemBlue
        viewControllers = [wordsController, studyingWordsController, knownWordsController]
    }
}
