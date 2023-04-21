//
//  KnowCell.swift
//  english-words
//
//  Created by user on 13.04.2023.
//

import UIKit

final class KnowCell: UITableViewCell {

    static let reuseId = "WordCell"

    private let wordLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.UIFonts.wordLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let phraseLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.UIFonts.phraseLabelFont
        label.textColor = Resources.Colors.phraseLabelColor
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let musicButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "speaker.wave.3"), for: .normal)

        return button
    }()

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
        addSubview(musicButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            musicButton.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            musicButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            musicButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),

            wordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            wordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 72),
            wordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)

//            phraseLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 5),
//            phraseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 72),
//            phraseLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}