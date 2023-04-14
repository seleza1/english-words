//
//  MainTabBarController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    private var wordsController: WordsViewController = {
        let controller = WordsViewController()
        let image = UIImage(systemName: "textformat.alt")
        let selectedImage = UIImage(systemName: "textformat.alt")
        let tabItem = UITabBarItem.init(title: "Мой словарь", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem

        return controller
    }()

    private var studyingWordsController: StudyingWordsViewController = {
        let controller = StudyingWordsViewController()
        let image = UIImage(systemName: "bed.double.fill")
        let selectedImage = UIImage(systemName: "bed.double.fill")
        let tabItem = UITabBarItem.init(title: "Изучаю", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem

        return controller
    }()

    private var knownWordsController: KnownWordsViewController = {
        let controller = KnownWordsViewController()
        let image = UIImage(systemName: "pencil")
        let selectedImage = UIImage(systemName: "pencil")
        let tabItem = UITabBarItem.init(title: "Знаю", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem

        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        tabBar.tintColor = #colorLiteral(red: 0.2317892015, green: 0.2613468766, blue: 0.9948940873, alpha: 1)
        viewControllers = [wordsController, studyingWordsController, knownWordsController]
    }
}
