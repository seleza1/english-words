//
//  Button.swift
//  english-words
//
//  Created by user on 04.06.2023.
//

import UIKit

extension VariantButton {

    enum State {
        case unknown
        case wrong
        case right
    }
}

class VariantButton: UIButton {

    var onTap: (() -> Void)?

    var variantState: State = .unknown {
        didSet {
            switch variantState {
            case .unknown:
                backgroundColor = .designSystemWhite
                setTitleColor(.designSystemGrey, for: .normal)
            case .wrong:
                backgroundColor = .designSystemRose
                setTitleColor(.designSystemWhite, for: .normal)
            case .right:
                backgroundColor = .designSystemGreen
                setTitleColor(.designSystemWhite, for: .normal)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        titleLabel?.font = .variantButtonFont
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.designSystemWhiteSky.cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonTapped() {
        onTap?()
    }
}
