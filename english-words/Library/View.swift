//
//  View.swift
//  english-words
//
//  Created by user on 16.05.2023.
//

import UIKit

enum ViewStyle {
    case roundView
    case roundSoundView
}

class View: UIView {

    init(style: ViewStyle) {
        super.init(frame: .zero)

        switch style {
        case .roundView:
            self.layer.cornerRadius = 12
            self.layer.borderColor = #colorLiteral(red: 0.9286816716, green: 0.9333788753, blue: 0.9420259595, alpha: 1)
            self.layer.borderWidth = 1

        case .roundSoundView:
            self.layer.cornerRadius = 24
            self.layer.borderWidth = 1
            self.backgroundColor = #colorLiteral(red: 0.9286816716, green: 0.9333788753, blue: 0.9420259595, alpha: 1)
            self.layer.borderColor = #colorLiteral(red: 0.9286816716, green: 0.9333788753, blue: 0.9420259595, alpha: 1)
        }

        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
