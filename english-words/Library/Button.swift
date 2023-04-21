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
            //self.setImage(UIImage(systemName: "speaker.wave.3"), for: .normal)
            self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }

        self.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc func buttonTapped() {
        onAction?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
