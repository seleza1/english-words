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
        let image = UIImage(systemName: "menucard")
        let selectedImage = UIImage(systemName: "menucard.fill")
        let tabItem = UITabBarItem.init(title: "Меню", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem

        return controller
    }()

    private var knownWordsController: KnownWordsViewController = {
        let controller = KnownWordsViewController()
        let image = UIImage(systemName: "cart")
        let selectedImage = UIImage(systemName: "cart.fill")
        let tabItem = UITabBarItem.init(title: "Корзина", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem

        return controller
    }()

    private var noKnownWordsController: NoKnowWordsViewController = {
        let controller = NoKnowWordsViewController()
        let image = UIImage(systemName: "cart")
        let selectedImage = UIImage(systemName: "cart.fill")
        let tabItem = UITabBarItem.init(title: "Корзина", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem

        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        tabBar.tintColor = .green
        viewControllers = [wordsController, knownWordsController, noKnownWordsController]
    }
}
