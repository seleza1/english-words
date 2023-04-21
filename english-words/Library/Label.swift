//
//  Label.swift
//  english-words
//
//  Created by user on 21.04.2023.
//

import UIKit

/*
private let wordLabel: UILabel = {
    let label = UILabel()
    label.font = Resources.UIFonts.wordLabelFont
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
}()

private let phraseLabel: UILabel = {
    let label = UILabel()
    label.font = Resources.UIFonts.phraseLabelFont
    label.textColor = Resources.Colors.phraseLabelColor
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
}()
*/

enum LabelStyle {
    case word
    case phrase
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

        }

        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
