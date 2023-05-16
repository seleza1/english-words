//
//  WordCell.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class WordCell: UITableViewCell {

    // MARK: - Private Properties

    private let wordLabel = Label(style: .word)
    private let soundButton = Button(style: .sound)

    private let roundView = View(style: .roundView)
    private let roundSoundView = View(style: .roundSoundView)

    // MARK: - Static Properties

    static let reuseId = "WordCell"

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func update(_ word: Word) {
        wordLabel.text = word.word
    }
}

// MARK: - Extension

private extension WordCell {

    // MARK: - Private Methods

    func setupViews() {
        addSubview(wordLabel)
        addSubview(roundView)
        addSubview(roundSoundView)
        roundSoundView.addSubview(soundButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            soundButton.topAnchor.constraint(equalTo: roundSoundView.topAnchor, constant: 12),
            soundButton.leadingAnchor.constraint(equalTo: roundSoundView.leadingAnchor, constant: 12),
            soundButton.trailingAnchor.constraint(equalTo: roundSoundView.trailingAnchor, constant: -12),
            soundButton.bottomAnchor.constraint(equalTo: roundSoundView.bottomAnchor, constant: -12),

            wordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 41),
            wordLabel.leadingAnchor.constraint(equalTo: roundSoundView.trailingAnchor, constant: 16),
            wordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            wordLabel.heightAnchor.constraint(equalToConstant: 22),

            roundView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            roundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            roundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            roundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),

            roundSoundView.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 28),
            roundSoundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            roundSoundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            roundSoundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -287),
            roundSoundView.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
