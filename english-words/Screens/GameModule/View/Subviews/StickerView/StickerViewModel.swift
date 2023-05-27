//
//  StickerViewModel.swift
//  english-words
//
//  Created by user on 19.05.2023.
//

import UIKit

struct StickerViewModel {

    let word: String
    let translation: String?
    let showHintButton: Bool
    let backgroundColor: UIColor

    init(
        word: String,
        translation: String?,
        showHintButton: Bool? = nil,
        backgroundColor: UIColor
    ) {
        self.word = word
        self.translation = translation
        self.backgroundColor = backgroundColor

        if let needShow = showHintButton {
            self.showHintButton = needShow
        } else {
            self.showHintButton = translation != nil
        }
    }
}
