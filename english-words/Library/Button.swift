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
}

class Button: UIButton {

    var onAction: (()->())?

    init(style: ButtonStyle) {
        super.init(frame: .zero)

        switch style {

        case .sound:
            self.setImage(UIImage(systemName: "speaker.wave.3"), for: .normal)

        case .close:
            self.setImage(UIImage(systemName: "xmark"), for: .normal)
            self.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

        case .start:
            self.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
            self.setTitle("Начать обучение", for: .normal)
            self.setTitleColor(UIColor.black, for: .normal)
            self.backgroundColor = Resources.Colors.startLearnButtonColor
            self.layer.cornerRadius = 11

        }
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc func closeButtonTapped() {
        onAction?()
    }

    @objc func startButtonTapped() {
        onAction?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
