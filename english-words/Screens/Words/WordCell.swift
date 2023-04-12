//
//  WordCell.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

class WordCell: UITableViewCell {

    static let reuseId = "WordCell"

    private let wordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "laugh"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let phraseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 6)
        label.text = "He started out in blues"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let musicButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "play.rectangle"), for: .normal)

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
        phraseLabel.text = word.phrase
    }
}

extension WordCell {
    private func setupViews() {
        addSubview(wordLabel)
        addSubview(phraseLabel)
        addSubview(musicButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            wordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            wordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),

            phraseLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 5),
            phraseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            phraseLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),

            musicButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            musicButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            musicButton.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
}
