//
//  MainTabBarController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    private var wordsController: WordsViewController = {
        let controller = WordsViewController()
        let image = UIImage.wordsControllerIcon
        let selectedImage = UIImage.wordsControllerIcon
        let tabItem = Resources.Title.tabItemWords
        controller.tabBarItem = tabItem

        return controller
    }()

    private var studyingWordsController: StudyingWordsViewController = {
        let controller = StudyingWordsViewController()
        let image = UIImage.studyingWordsController
        let selectedImage = UIImage.studyingWordsController
        let tabItem = Resources.Title.tabItemStudying
        controller.tabBarItem = tabItem

        return controller
    }()

    private var knownWordsController: KnownWordsViewController = {
        let controller = KnownWordsViewController()
        let image = UIImage.knownWordsController
        let selectedImage = UIImage.knownWordsController
        let tabItem = Resources.Title.tabItemKnown
        controller.tabBarItem = tabItem

        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        tabBar.tintColor = Resources.Colors.tabBarTintColor
        viewControllers = [wordsController, studyingWordsController, knownWordsController]
    }
}
