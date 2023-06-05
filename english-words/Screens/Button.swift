//
//  Button.swift
//  english-words
//
//  Created by user on 04.06.2023.
//

import UIKit

enum ButtonStyle {

    case one
    case two
    case three
    case four
}

class Button: UIButton {

    var onAction: (()->())?

    init(style: ButtonStyle) {
        super.init(frame: .zero)

        switch style {

        case .one:
            self.backgroundColor = .designSystemWhite
            self.setTitleColor(.designSystemGrey, for: .normal)

            self.layer.cornerRadius = 12
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.designSystemWhiteSky.cgColor
            self.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)

        case .two:
            self.backgroundColor = .designSystemWhite
            self.setTitleColor(.designSystemGrey, for: .normal)

            self.layer.cornerRadius = 12
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.designSystemWhiteSky.cgColor
            self.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)

        case .three:
            self.backgroundColor = .designSystemWhite
            self.setTitleColor(.designSystemGrey, for: .normal)

            self.layer.cornerRadius = 12
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.designSystemWhiteSky.cgColor
            self.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)

        case .four:
            self.backgroundColor = .designSystemWhite
            self.setTitleColor(.designSystemGrey, for: .normal)

            self.layer.cornerRadius = 12
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.designSystemWhiteSky.cgColor
            self.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
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
