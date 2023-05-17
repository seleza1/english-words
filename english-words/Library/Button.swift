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
    case two
    case three
    case four
    case repeatW
}

class Button: UIButton {

    var onAction: (()->())?

    init(style: ButtonStyle) {
        super.init(frame: .zero)

        switch style {
            
        case .sound:
            self.setImage(UIImage(named: Resources.Icons.soundIcon), for: .normal)

        case .close:
            self.setImage(UIImage(named: Resources.Icons.closeIcon), for: .normal)

        case .start:
            self.setTitle(Resources.Title.startToLearnButtonTitle, for: .normal)
            self.backgroundColor = Resources.Colors.startLearnButtonColor
            self.setTitleColor(UIColor.black, for: .normal)
            self.layer.cornerRadius = 11

        case .repeatW:
            self.setTitle(Resources.Title.startToRepeatButtonTitle, for: .normal)
            self.backgroundColor = Resources.Colors.startLearnButtonColor
            self.setTitleColor(UIColor.black, for: .normal)

        case .hint:
            self.setImage(UIImage(named: Resources.Icons.hintIcon), for: .normal)
            self.backgroundColor = Resources.Colors.backgroundButtonColor

        case .one:
            self.backgroundColor = Resources.Colors.backgroundButtonColor
            self.setTitleColor(Resources.Colors.buttonColor, for: .normal)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            self.titleLabel?.textColor = #colorLiteral(red: 0.6000000834, green: 0.5999999642, blue: 0.6000000238, alpha: 1)
            self.layer.borderWidth = 1
            self.layer.borderColor = #colorLiteral(red: 0.938919723, green: 0.9531306624, blue: 0.9746883512, alpha: 1)

        case .two:
            self.backgroundColor = Resources.Colors.backgroundButtonColor
            self.setTitleColor(Resources.Colors.buttonColor, for: .normal)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            self.titleLabel?.textColor = #colorLiteral(red: 0.6000000834, green: 0.5999999642, blue: 0.6000000238, alpha: 1)
            self.layer.borderWidth = 1
            self.layer.borderColor = #colorLiteral(red: 0.938919723, green: 0.9531306624, blue: 0.9746883512, alpha: 1)

        case .three:
            self.backgroundColor = Resources.Colors.backgroundButtonColor
            self.setTitleColor(Resources.Colors.buttonColor, for: .normal)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            self.titleLabel?.textColor = #colorLiteral(red: 0.6000000834, green: 0.5999999642, blue: 0.6000000238, alpha: 1)
            self.layer.borderWidth = 1
            self.layer.borderColor = #colorLiteral(red: 0.938919723, green: 0.9531306624, blue: 0.9746883512, alpha: 1)

        case .four:
            self.backgroundColor = Resources.Colors.backgroundButtonColor
            self.setTitleColor(Resources.Colors.buttonColor, for: .normal)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            self.titleLabel?.textColor = #colorLiteral(red: 0.6000000834, green: 0.5999999642, blue: 0.6000000238, alpha: 1)
            self.layer.borderWidth = 1
            self.layer.borderColor = #colorLiteral(red: 0.938919723, green: 0.9531306624, blue: 0.9746883512, alpha: 1)

        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.layer.cornerRadius = 15
    }

    @objc func buttonTapped() {
        onAction?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
