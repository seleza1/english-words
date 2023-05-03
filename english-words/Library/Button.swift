//
//  Button.swift
//  english-words
//
//  Created by user on 21.04.2023.
//

import UIKit

enum ButtonStyle {
    case sound
    case close
    case start
    case hint
    case one
    case second
    case two
    case three
    case repeatW
}

class Button: UIButton {

    var onAction: (()->())?

    init(style: ButtonStyle) {
        super.init(frame: .zero)

        switch style {

        case .sound:
            self.setImage(UIImage(systemName: Resources.Icons.soundIcon), for: .normal)

        case .close:
            self.setImage(UIImage(systemName: Resources.Icons.closeIcon), for: .normal)
            //self.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

        case .start:
            //self.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
            self.setTitle(Resources.Title.startToLearnButtonTitle, for: .normal)
            self.setTitleColor(UIColor.black, for: .normal)
            self.backgroundColor = Resources.Colors.startLearnButtonColor
            self.layer.cornerRadius = 11

        case .repeatW:
            self.setTitle(Resources.Title.startToRepeatButtonTitle, for: .normal)
            self.layer.cornerRadius = 15
            self.setTitleColor(UIColor.black, for: .normal)
            self.backgroundColor = Resources.Colors.startLearnButtonColor
            //self.addTarget(self, action: #selector(nextQuest), for: .touchUpInside)

        case .hint:
            self.setImage(UIImage(systemName: Resources.Icons.hintIcon), for: .normal)
            self.backgroundColor = Resources.Colors.backgroundButtonColor

        case .one:
            self.setTitle("Пейзаж", for: .normal)
            self.layer.cornerRadius = 15
            self.setTitleColor(UIColor.black, for: .normal)
            self.backgroundColor = Resources.Colors.backgroundButtonColor


        case .second:
            self.setTitle("Выравнивание", for: .normal)
            self.layer.cornerRadius = 15
            self.setTitleColor(UIColor.black, for: .normal)
            self.backgroundColor = Resources.Colors.backgroundButtonColor

        case .two:
            self.setTitle("Перемещение", for: .normal)
            self.layer.cornerRadius = 15
            self.setTitleColor(UIColor.black, for: .normal)
            self.backgroundColor = Resources.Colors.backgroundButtonColor

        case .three:
            self.setTitle("Сдвиг", for: .normal)
            self.layer.cornerRadius = 15
            self.setTitleColor(UIColor.black, for: .normal)
            self.backgroundColor = Resources.Colors.backgroundButtonColor

        }
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        onAction?()
    }

//    @objc func startButtonTapped() {
//        onAction?()
//    }
//
//    @objc func nextQuest() {
//        onAction?()
//    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
