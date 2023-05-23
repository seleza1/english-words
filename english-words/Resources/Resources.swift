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
        static let startLearnButtonColor =  #colorLiteral(red: 0.2317892015, green: 0.2613468766, blue: 0.9948940873, alpha: 1)
        static let phraseLabelColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        static let backgroundButtonColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let wordKnownButton = #colorLiteral(red: 1, green: 0.229614228, blue: 0.1135809645, alpha: 1)
        static let justGreen = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        static let buttonColor = UIColor.gray
    }

    // MARK: - Icons

    enum Icons {
        
        static let soundIcon = "sound"
        static let closeIcon = "chevron"
        static let hintIcon = "key"
    }

    // MARK: - Title

    enum Title {

        static let selectAnswerLabel = "Выберите правильный ответ"

        static let startToLearnButtonTitle = "Начать обучение"
        static let startToRepeatButtonTitle = "Повторить слова"

        static let wordsLearnHeader = "Слов на изучение"

        static let allWordsHeader = "Слов осталось"
        static let allLearnHeader = "Всего изучено"

    }
}
