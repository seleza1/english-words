//
//  Resources.swift
//  english-words
//
//  Created by user on 15.04.2023.
//

import UIKit

enum Resources {

    // MARK: - Colors

    enum Colors {
        static let tabBarTintColor = #colorLiteral(red: 0.2317892015, green: 0.2613468766, blue: 0.9948940873, alpha: 1)
        static let startLearnButtonColor =  #colorLiteral(red: 0.992441237, green: 0.8533335924, blue: 0.4606403112, alpha: 1)
        static let phraseLabelColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        static let uiViewColor = #colorLiteral(red: 0.9741126895, green: 0.9580762982, blue: 0.7994511127, alpha: 1)
        static let backgroundButtonColor = #colorLiteral(red: 0.9529412389, green: 0.9529411197, blue: 0.9529412389, alpha: 1)
        static let wordKnownButton = #colorLiteral(red: 1, green: 0.229614228, blue: 0.1135809645, alpha: 1)
        static let justGreen = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }

    // MARK: - UIFonts

    enum UIFonts {
        static let wordLabelFont = UIFont.boldSystemFont(ofSize: 18)
        static let phraseLabelFont = UIFont.boldSystemFont(ofSize: 9)
        static let wordLabelGameFont = UIFont.boldSystemFont(ofSize: 30)
        static let wordLabelMin = UIFont.systemFont(ofSize: 24)
    }

    // MARK: - Icons

    enum Icons {
        static let wordsControllerIcon = UIImage(systemName: "textformat.alt")
        static let studyingWordsController = UIImage(systemName: "bed.double.fill")
        static let knownWordsController = UIImage(systemName: "pencil")
        static let soundIcon = "speaker.wave.3"
        static let closeIcon = "xmark"
        static let hintIcon = "lightbulb"
    }

    // MARK: - Title

    enum Title {
        static let tabItemWords = UITabBarItem.init(
            title: "Мой словарь",
            image: Icons.wordsControllerIcon,
            selectedImage: Icons.wordsControllerIcon
        )

        static let tabItemStudying = UITabBarItem.init(
            title: Resources.Title.tableViewLearnButtonTitle,
            image: Icons.studyingWordsController,
            selectedImage: Icons.studyingWordsController
        )

        static let tabItemKnown = UITabBarItem.init(
            title: Resources.Title.tableViewKnownButtonTitle,
            image: Icons.knownWordsController,
            selectedImage: Icons.knownWordsController
        )

        static let tableViewKnownButtonTitle = "Знаю"
        static let tableViewLearnButtonTitle = "Изучаю"

        static let selectAnswerLabel = "Выберите правильный ответ"

        static let startToLearnButtonTitle = "Начать обучение"
        static let startToRepeatButtonTitle = "Повторить слова"

        static let wordsLearnHeader = "Слов на изучение"

        static let allWordsHeader = "Слов осталось"
        static let allLearnHeader = "Всего изучено"
    }
}
