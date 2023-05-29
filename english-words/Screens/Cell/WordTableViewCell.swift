//
//  WordTableViewCell.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class WordTableViewCell: UITableViewCell {

    // MARK: - Private Properties

    private let wordLabel = UILabel()

    private let roundView = UIView()

    private let soundButton = UIButton()

    private let statusImageView = UIImageView()

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

    func configure(_ word: WordTableViewCellModel) {
        wordLabel.text = word.word

        if let wordLearned = word.isLearned {
            if wordLearned {
                statusImageView.image = .successIcon
                statusImageView.isHidden = false
                statusImageView.backgroundColor = .designSystemGreen
            } else {
                statusImageView.image = .repeatIcon
                statusImageView.isHidden = false
                statusImageView.backgroundColor = .designSystemOrange
            }
        } else {
            statusImageView.isHidden = true
        }
    }
}

// MARK: - Extension

private extension WordTableViewCell {

    // MARK: - Private Methods

    func setupViews() {
        addSubview(wordLabel)
        addSubview(roundView)
        addSubview(soundButton)
        addSubview(statusImageView)

        wordLabel.font = UIFont.wordLabelFont

        roundView.layer.cornerRadius = 12
        roundView.layer.borderColor = UIColor.designSystemLightGray?.cgColor
        roundView.layer.borderWidth = 1

        soundButton.layer.cornerRadius = 24
        soundButton.layer.borderWidth = 1
        soundButton.backgroundColor = .designSystemLightGray
        soundButton.layer.borderColor = UIColor.designSystemLightGray?.cgColor
        soundButton.setImage(UIImage.soundSpeakerImage, for: .normal)

        statusImageView.layer.cornerRadius = 18
        statusImageView.contentMode = .center
    }

    func setupConstraints() {
        
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 41),
            wordLabel.leadingAnchor.constraint(equalTo: soundButton.trailingAnchor, constant: 16),
            wordLabel.trailingAnchor.constraint(equalTo: statusImageView.leadingAnchor, constant: -16),
            wordLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        roundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            roundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            roundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            roundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
        soundButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            soundButton.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 28),
            soundButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            soundButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            soundButton.heightAnchor.constraint(equalToConstant: 48),
            soundButton.widthAnchor.constraint(equalToConstant: 48)
        ])
        
        statusImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusImageView.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 34),
            statusImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            statusImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
            statusImageView.heightAnchor.constraint(equalToConstant: 36),
            statusImageView.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
}
