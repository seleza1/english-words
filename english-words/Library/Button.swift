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

            self.setTitle(.startToLearnButtonTitle, for: .normal)
            self.setTitleColor(UIColor.white, for: .normal)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            self.backgroundColor = Resources.Colors.startLearnButtonColor
            self.layer.cornerRadius = 33

        case .repeatW:
            self.setTitle(.startToRepeatButtonTitle, for: .normal)
            self.backgroundColor = Resources.Colors.startLearnButtonColor
            self.setTitleColor(UIColor.black, for: .normal)

        case .hint:
            self.setImage(UIImage(named: Resources.Icons.hintIcon), for: .normal)
            self.backgroundColor = Resources.Colors.backgroundButtonColor
            self.setTitleColor(UIColor.black, for: .normal)

        case .one:
            self.backgroundColor = Resources.Colors.backgroundButtonColor
            self.setTitleColor(UIColor.black, for: .normal)

        case .two:
            self.backgroundColor = Resources.Colors.backgroundButtonColor
            self.setTitleColor(UIColor.black, for: .normal)

        case .three:
            self.backgroundColor = Resources.Colors.backgroundButtonColor
            self.setTitleColor(UIColor.black, for: .normal)

        case .four:
            self.backgroundColor = Resources.Colors.backgroundButtonColor
            self.setTitleColor(UIColor.black, for: .normal)
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        onAction?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
