//
//  MainTabBarController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    private var wordsController: WordsVC = {
        let controller = WordsVC()
        let image = Resources.Icons.wordsControllerIcon
        let selectedImage = Resources.Icons.wordsControllerIcon
        let tabItem = Resources.Title.tabItemWords
        controller.tabBarItem = tabItem

        return controller
    }()

    private var studyingWordsController: StudyingWordsVC = {
        let controller = StudyingWordsVC()
        let image = Resources.Icons.studyingWordsController
        let selectedImage = Resources.Icons.studyingWordsController
        let tabItem = Resources.Title.tabItemStudying
        controller.tabBarItem = tabItem

        return controller
    }()

    private var knownWordsController: KnownWordsViewController = {
        let controller = KnownWordsViewController()
        let image = Resources.Icons.knownWordsController
        let selectedImage = Resources.Icons.knownWordsController
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
