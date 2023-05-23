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
        let wordsController = WordsViewController()
        wordsController.tabBarItem = UITabBarItem(
            title: .dictionary,
            image: UIImage(named: "books"),
            selectedImage: UIImage(named: "books_selected")
        )

        let studyingWordsController = StudyingWordsViewController()
        studyingWordsController.tabBarItem = UITabBarItem(
            title: .learn,
            image: UIImage(named: "coffee"),
            selectedImage: UIImage(named: "coffee_selected")
        )

        let knownWordsController = KnownWordsViewController()
        knownWordsController.tabBarItem = UITabBarItem(
            title: .known,
            image: UIImage(named: "smile"),
            selectedImage: UIImage(named: "smile_selected")
        )

        tabBar.tintColor = Resources.Colors.tabBarTintColor
        viewControllers = [wordsController, studyingWordsController, knownWordsController]
    }
}
