//
//  TableViewCell.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class TableViewCell: UITableViewCell {

    // MARK: - Private Properties

    private let wordLabel = Label(style: .word)
    private let soundButton = Button(style: .sound)

    private let roundView = View(style: .roundView)
    private let roundSoundView = View(style: .roundSoundView)

    private var repeatButton = UIButton()
    private var successButton = UIButton()

    let repeatView = UIView()
    let successView = UIView()

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

    func configure(_ word: TableViewModel) {
        wordLabel.text = word.word

        if word.isLearned == true {
            successButton.setImage(UIImage(named: "succes"), for: .normal)
            successView.backgroundColor = #colorLiteral(red: 0.2067455649, green: 0.8660475612, blue: 0.5491089821, alpha: 1)
        } else if word.isLearned == false {
            repeatView.backgroundColor = #colorLiteral(red: 1, green: 0.7154690623, blue: 0, alpha: 1)
            repeatButton.setImage(UIImage(named: "repeat"), for: .normal)
            successView.isHidden = true
        } else {
            successView.isHidden = true
            repeatView.isHidden = true
        }
    }
}

// MARK: - Extension

private extension TableViewCell {

    // MARK: - Private Methods

    func setupViews() {
        addSubview(wordLabel)
        addSubview(roundView)
        addSubview(roundSoundView)
        addSubview(repeatView)
        addSubview(successView)

        successView.addSubview(successButton)
        repeatView.addSubview(repeatButton)
        roundSoundView.addSubview(soundButton)


        repeatView.layer.cornerRadius = 18
        repeatView.layer.borderWidth = 1
        repeatView.backgroundColor = #colorLiteral(red: 0.9932733178, green: 0.7303369641, blue: 0.2200130522, alpha: 1)
        repeatView.layer.borderColor = #colorLiteral(red: 0.9286816716, green: 0.9333788753, blue: 0.9420259595, alpha: 1)

        successView.layer.cornerRadius = 18
        successView.layer.borderWidth = 1
        successView.backgroundColor = #colorLiteral(red: 0.2067455649, green: 0.8660475612, blue: 0.5491089821, alpha: 1)
        successView.layer.borderColor = #colorLiteral(red: 0.9286816716, green: 0.9333788753, blue: 0.9420259595, alpha: 1)

    }

    func setupConstraints() {
        successView.translatesAutoresizingMaskIntoConstraints = false
        successButton.translatesAutoresizingMaskIntoConstraints = false
        repeatView.translatesAutoresizingMaskIntoConstraints = false
        repeatButton.translatesAutoresizingMaskIntoConstraints = false
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
            roundSoundView.heightAnchor.constraint(equalToConstant: 48),

            repeatView.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 34),
            repeatView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 299),
            repeatView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
            repeatView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            repeatView.heightAnchor.constraint(equalToConstant: 36),

            repeatButton.topAnchor.constraint(equalTo: repeatView.topAnchor, constant: 6),
            repeatButton.leadingAnchor.constraint(equalTo: repeatView.leadingAnchor, constant: 6),
            repeatButton.trailingAnchor.constraint(equalTo: repeatView.trailingAnchor, constant: -6),
            repeatButton.bottomAnchor.constraint(equalTo: repeatView.bottomAnchor, constant: -6),

            successView.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 34),
            successView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 299),
            successView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
            successView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            successView.heightAnchor.constraint(equalToConstant: 36),

            successButton.topAnchor.constraint(equalTo: successView.topAnchor, constant: 6),
            successButton.leadingAnchor.constraint(equalTo: successView.leadingAnchor, constant: 6),
            successButton.trailingAnchor.constraint(equalTo: successView.trailingAnchor, constant: -6),
            successButton.bottomAnchor.constraint(equalTo: successView.bottomAnchor, constant: -6),


        ])
    }
}
