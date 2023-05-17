//
//  View.swift
//  english-words
//
//  Created by user on 17.05.2023.
//

import UIKit

enum ViewStyle {
    case card
    case hint
    case sound
}

class View: UIView {

    var onAction: (()->())?

    init(style: ViewStyle) {
        super.init(frame: .zero)

        switch style {
            
        case .card:
            self.backgroundColor = Resources.Colors.uiViewColor
            self.layer.cornerRadius = 9

        case .hint:
            self.backgroundColor = .white
            self.layer.cornerRadius = 22

        case .sound:
            self.backgroundColor = .white
            self.layer.cornerRadius = 22


        }
        self.translatesAutoresizingMaskIntoConstraints = false

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
