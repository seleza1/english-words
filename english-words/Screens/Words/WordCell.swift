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

    private let roundView = UIView()

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
        roundView.translatesAutoresizingMaskIntoConstraints = false
        roundView.layer.cornerRadius = 12
        roundView.layer.borderColor = UIColor.red.cgColor
        roundView.layer.borderWidth = 1
        addSubview(wordLabel)
        addSubview(soundButton)
        addSubview(roundView)


    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            soundButton.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            soundButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            soundButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),

            wordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            wordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 72),
            wordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            roundView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            roundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            roundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            roundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
