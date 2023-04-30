//
//  GameView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class GameView: UIView {

    let progressView: UIProgressView = {
        let indicatorProgress = UIProgressView()
        indicatorProgress.translatesAutoresizingMaskIntoConstraints = false

        return indicatorProgress
    }()

    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.uiViewColor
        view.layer.cornerRadius = 9
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let stackView = UIStackView()

    let closeButton = Button(style: .close)
    let oneButton = Button(style: .one)
    private let hintButton = Button(style: .hint)
    private let secondButton = Button(style: .second)
    private let twoButton = Button(style: .two)
    private let threeButton = Button(style: .three)

    private let selectAnswerLabel = Label(style: .select)
    private let wordLabel = Label(style: .wordGame)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupStackView()


        self.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameView {
    private func setupViews() {
        self.addSubview(closeButton)
        self.addSubview(progressView)
        self.addSubview(selectAnswerLabel)
        self.addSubview(cardView)
        self.addSubview(oneButton)
        self.addSubview(twoButton)
        self.addSubview(threeButton)
        self.addSubview(secondButton)
        self.addSubview(stackView)

        cardView.addSubview(wordLabel)
        cardView.addSubview(hintButton)
        self.backgroundColor = .white
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10

        stackView.addArrangedSubview(oneButton)
        stackView.addArrangedSubview(secondButton)
        stackView.addArrangedSubview(twoButton)
        stackView.addArrangedSubview(threeButton)

        stackView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 9),

            progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 64),
            progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 82),
            progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -82),
            progressView.heightAnchor.constraint(equalToConstant: 6),

            selectAnswerLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 9),
            selectAnswerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            selectAnswerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            cardView.topAnchor.constraint(equalTo: selectAnswerLabel.bottomAnchor, constant: 16),
            cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            cardView.heightAnchor.constraint(equalToConstant: 223),

            wordLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 78),
            wordLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 32),
            wordLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -32),

            hintButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -6),
            hintButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -6),

            stackView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            oneButton.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 6),
            oneButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 6),
            oneButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -6),
            oneButton.heightAnchor.constraint(equalToConstant: 44),

            secondButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: 9),
            secondButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 6),
            secondButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -6),
            secondButton.heightAnchor.constraint(equalToConstant: 44),

            twoButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 9),
            twoButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 6),
            twoButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -6),
            twoButton.heightAnchor.constraint(equalToConstant: 44),

            threeButton.topAnchor.constraint(equalTo: twoButton.bottomAnchor, constant: 9),
            threeButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 6),
            threeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -6),
            threeButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
