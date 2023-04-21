//
//  KnowCell.swift
//  english-words
//
//  Created by user on 13.04.2023.
//

import UIKit

final class KnowCell: UITableViewCell {

    static let reuseId = "WordCell"

    private let wordLabel = Label(style: .word)
    private let phraseLabel = Label(style: .phrase)
    private let soundButton = Button(style: .sound)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(_ word: Word) {
        wordLabel.text = word.word
        // phraseLabel.text = word.phrase
    }
}

extension KnowCell {
    private func setupViews() {
        addSubview(wordLabel)
        addSubview(phraseLabel)
        addSubview(soundButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            soundButton.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            soundButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            soundButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),

            wordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            wordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 72),
            wordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
