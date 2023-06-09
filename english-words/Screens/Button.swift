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

    var onAction: (() -> Void)?

    var variantStateUnknown: State = .unknown {
        didSet {
            backgroundColor = .designSystemWhite
            setTitleColor(.designSystemGrey, for: .normal)
        }
    }

    var variantStateWrong: State = .wrong {
        didSet {
            backgroundColor = .designSystemRose
            setTitleColor(.designSystemWhite, for: .normal)
        }
    }

    var variantStateRight: State = .right {
        didSet {
            backgroundColor = .designSystemGreen
            setTitleColor(.designSystemWhite, for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonTapped() {
        onAction?()
    }
}
