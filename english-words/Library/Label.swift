//
//  Label.swift
//  english-words
//
//  Created by user on 21.04.2023.
//

import UIKit

enum LabelStyle {
    case word
    case phrase
    case select
    case wordGame
    case wordMeaning
    case translate
}

class Label: UILabel {

    init(style: LabelStyle) {
        super.init(frame: .zero)

        switch style {

        case .word:
            self.font = Resources.UIFonts.wordLabelFont
            
        case .phrase:
            self.font = Resources.UIFonts.phraseLabelFont
            self.textColor = Resources.Colors.phraseLabelColor

        case .select:
            self.text = Resources.Title.selectAnswerLabel
            self.textAlignment = .center

        case .wordGame:
            self.textAlignment = .center
            self.font = Resources.UIFonts.wordLabelGameFont
            self.numberOfLines = 0

        case .wordMeaning:
            self.textAlignment = .center
            self.font = Resources.UIFonts.wordLabelMin

        case .translate:
            self.numberOfLines = 0

        }

        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
