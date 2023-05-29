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
        let wordsController = WordsViewController(viewModel: WordsViewModel())
        wordsController.tabBarItem = UITabBarItem(
            title: .dictionary,
            image: UIImage.booksImage,
            selectedImage: UIImage.booksSelectedImage
        )

        let studyingWordsController = StudyingWordsViewController(viewModel: StudyingWordsModel())
        studyingWordsController.tabBarItem = UITabBarItem(
            title: .tableViewLearnButtonTitle,
            image: UIImage.coffeeImage,
            selectedImage: UIImage.coffeeSelectedImage
        )

        let knownWordsController = KnownWordsViewController(viewModel: KnowWordsViewModel())
        knownWordsController.tabBarItem = UITabBarItem(
            title: .tableViewKnownButtonTitle,
            image: UIImage.smileImage,
            selectedImage: UIImage.smileSelectedImage
        )

        tabBar.tintColor = .designSystemBlue
        viewControllers = [wordsController, studyingWordsController, knownWordsController]
    }
}
