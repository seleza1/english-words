//
//  TableViewCell.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class TableViewCell: UITableViewCell {

    // MARK: - Private Properties

    private let wordLabel = UILabel()

    private let roundView = UIView()

    private let soundButton = UIButton()
    private let repeatButton = UIButton()
    private let successButton = UIButton()

    // MARK: - Static Properties

    static let reuseId = "WordCell"

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        soundButton.showsTouchWhenHighlighted = true

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(_ word: TableViewModel) {
        wordLabel.text = word.word

        if word.isLearned == true {
            successButton.setImage(UIImage.successIcon, for: .normal)
            successButton.backgroundColor = .designSystemGreen
        } else if word.isLearned == false {
            repeatButton.backgroundColor = .designSystemOrange
            repeatButton.setImage(UIImage.repeatIcon, for: .normal)
            repeatButton.isHidden = true
        } else {
            successButton.isHidden = true
            repeatButton.isHidden = true
        }
    }
}

// MARK: - Extension

private extension TableViewCell {

    // MARK: - Private Methods

    func setupViews() {
        addSubview(wordLabel)
        addSubview(roundView)

        addSubview(successButton)
        addSubview(repeatButton)
        addSubview(soundButton)

        repeatButton.layer.cornerRadius = 18
        repeatButton.layer.borderWidth = 1
        repeatButton.backgroundColor = .designSystemOrange
        repeatButton.layer.borderColor = UIColor.designSystemLightGray?.cgColor
        repeatButton.setImage(UIImage.repeatIcon, for: .normal)

        successButton.layer.cornerRadius = 18
        successButton.layer.borderWidth = 1
        successButton.backgroundColor = .designSystemGreen
        successButton.layer.borderColor = UIColor.designSystemLightGray?.cgColor
        successButton.setImage(UIImage.successIcon, for: .normal)

        roundView.layer.cornerRadius = 12
        roundView.layer.borderColor = UIColor.designSystemLightGray?.cgColor
        roundView.layer.borderWidth = 1

        soundButton.layer.cornerRadius = 24
        soundButton.layer.borderWidth = 1
        soundButton.backgroundColor = .designSystemLightGray
        soundButton.layer.borderColor = UIColor.designSystemLightGray?.cgColor
        soundButton.setImage(UIImage.soundSpeakerImage, for: .normal)

        wordLabel.font = UIFont.wordLabelFont
    }

    func setupConstraints() {
        successButton.translatesAutoresizingMaskIntoConstraints = false
        repeatButton.translatesAutoresizingMaskIntoConstraints = false
        soundButton.translatesAutoresizingMaskIntoConstraints = false
        roundView.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 41),
            wordLabel.leadingAnchor.constraint(equalTo: soundButton.trailingAnchor, constant: 16),
            wordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            wordLabel.heightAnchor.constraint(equalToConstant: 22),

            roundView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            roundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            roundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            roundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),

            soundButton.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 28),
            soundButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            soundButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            soundButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -287),
            soundButton.heightAnchor.constraint(equalToConstant: 48),

            repeatButton.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 34),
            repeatButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 299),
            repeatButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
            repeatButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            repeatButton.heightAnchor.constraint(equalToConstant: 36),

            successButton.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 34),
            successButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 299),
            successButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
            successButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            successButton.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
}
