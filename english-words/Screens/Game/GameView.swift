//
//  GameView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class GameView: UIView {

    var onVariantChanged: (()->())?

    // MARK: - Private Properties

    private var word: WordModel?

    private let stackView = UIStackView()

    private let cardView = View(style: .card)
    private let hintView = View(style: .hint)
    private let soundView = View(style: .sound)

    private let selectAnswerLabel = Label(style: .select)
    private let wordLabel = Label(style: .wordGame)
    private let numberWordLabel = Label(style: .number)

    // MARK: - Public Properties

    let closeButton = Button(style: .close)
    let oneButton = Button(style: .one)
    let twoButton = Button(style: .two)
    let threeButton = Button(style: .three)
    let fourButton = Button(style: .four)
    let hintButton = Button(style: .hint)
    let soundButton = Button(style: .sound)

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
        setupStackView()
        buttonsTapped()
        
        numberWordLabel.text = "1 /4900"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func update(_ word: WordModel) {

        self.word = word

        wordLabel.text = word.word.capitalized

        oneButton.setTitle(word.variants[0].capitalized, for: .normal)
        twoButton.setTitle(word.variants[1].capitalized, for: .normal)
        threeButton.setTitle(word.variants[2].capitalized, for: .normal)
        fourButton.setTitle(word.variants[3].capitalized, for: .normal)
    }
}

// MARK: - Extension

private extension GameView {

    func setupViews() {
        addSubview(closeButton)
        addSubview(selectAnswerLabel)
        addSubview(cardView)
        addSubview(oneButton)
        addSubview(threeButton)
        addSubview(fourButton)
        addSubview(twoButton)
        addSubview(stackView)
        addSubview(numberWordLabel)

        cardView.addSubview(hintView)
        cardView.addSubview(soundView)
        cardView.addSubview(wordLabel)
        hintView.addSubview(hintButton)
        soundView.addSubview(soundButton)

        backgroundColor = .white
    }

    func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10

        stackView.addArrangedSubview(oneButton)
        stackView.addArrangedSubview(twoButton)
        stackView.addArrangedSubview(threeButton)
        stackView.addArrangedSubview(fourButton)

        stackView.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 61),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            closeButton.heightAnchor.constraint(equalToConstant: 28),

            selectAnswerLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 9),
            selectAnswerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            selectAnswerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 117),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardView.heightAnchor.constraint(equalToConstant: 240),
            cardView.widthAnchor.constraint(equalToConstant: 335),

            wordLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 89),
            wordLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 32),
            wordLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -32),
            wordLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -89),
            wordLabel.heightAnchor.constraint(equalToConstant: 52),

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -40),

            oneButton.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 6),
            oneButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 1),
            oneButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1),
            oneButton.heightAnchor.constraint(equalToConstant: 54),

            twoButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: 9),
            twoButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 1),
            twoButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1),
            twoButton.heightAnchor.constraint(equalToConstant: 54),

            threeButton.topAnchor.constraint(equalTo: twoButton.bottomAnchor, constant: 9),
            threeButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 1),
            threeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1),
            threeButton.heightAnchor.constraint(equalToConstant: 54),

            fourButton.topAnchor.constraint(equalTo: threeButton.bottomAnchor, constant: 9),
            fourButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 1),
            fourButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1),
            fourButton.heightAnchor.constraint(equalToConstant: 54),

            hintButton.topAnchor.constraint(equalTo: hintView.topAnchor, constant: 12),
            hintButton.leadingAnchor.constraint(equalTo: hintView.leadingAnchor, constant: 12),
            hintButton.trailingAnchor.constraint(equalTo: hintView.trailingAnchor, constant: -12),
            hintButton.bottomAnchor.constraint(equalTo: hintView.bottomAnchor, constant: -12),

            hintView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 180),
            hintView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 214),
            hintView.heightAnchor.constraint(equalToConstant: 48),

            soundView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 180),
            soundView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -12),
            soundView.heightAnchor.constraint(equalToConstant: 48),

            soundButton.topAnchor.constraint(equalTo: soundView.topAnchor, constant: 12),
            soundButton.leadingAnchor.constraint(equalTo: soundView.leadingAnchor, constant: 12),
            soundButton.trailingAnchor.constraint(equalTo: soundView.trailingAnchor, constant: -12),
            soundButton.bottomAnchor.constraint(equalTo: soundView.bottomAnchor, constant: -12),

            numberWordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            numberWordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 280),
            numberWordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            numberWordLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }

    func buttonsTapped() {
        oneButton.onAction = {

            if self.word?.variants[0] == self.word?.translate {
                self.oneButton.backgroundColor = #colorLiteral(red: 0.2067455649, green: 0.8660475612, blue: 0.5491089821, alpha: 1)
                self.oneButton.setTitleColor(UIColor.white, for: .normal)
            } else {
                self.oneButton.backgroundColor = #colorLiteral(red: 0.9983076453, green: 0.386271596, blue: 0.4940415621, alpha: 1)
                self.oneButton.setTitleColor(UIColor.white, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.oneButton.backgroundColor = Resources.Colors.backgroundButtonColor
                self.oneButton.setTitleColor(UIColor.gray, for: .normal)
                self.onVariantChanged?()
            }
        }

        twoButton.onAction = {
            
            if self.word?.variants[1] == self.word?.translate {
                self.twoButton.backgroundColor = #colorLiteral(red: 0.2067455649, green: 0.8660475612, blue: 0.5491089821, alpha: 1)
                self.twoButton.setTitleColor(UIColor.white, for: .normal)
            } else {
                self.twoButton.backgroundColor = #colorLiteral(red: 0.9983076453, green: 0.386271596, blue: 0.4940415621, alpha: 1)
                self.twoButton.setTitleColor(UIColor.white, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.twoButton.backgroundColor = Resources.Colors.backgroundButtonColor
                self.twoButton.setTitleColor(UIColor.gray, for: .normal)
                self.onVariantChanged?()
            }
        }

        threeButton.onAction = {

            if self.word?.variants[2] == self.word?.translate {
                self.threeButton.backgroundColor = #colorLiteral(red: 0.2067455649, green: 0.8660475612, blue: 0.5491089821, alpha: 1)
                self.threeButton.setTitleColor(UIColor.white, for: .normal)
            } else {
                self.threeButton.backgroundColor = #colorLiteral(red: 0.9983076453, green: 0.386271596, blue: 0.4940415621, alpha: 1)
                self.threeButton.setTitleColor(UIColor.white, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.threeButton.backgroundColor = Resources.Colors.backgroundButtonColor
                self.threeButton.setTitleColor(UIColor.gray, for: .normal)
                self.onVariantChanged?()
            }
        }

        fourButton.onAction = {

            if self.word?.variants[3] == self.word?.translate {
                self.fourButton.backgroundColor = #colorLiteral(red: 0.2067455649, green: 0.8660475612, blue: 0.5491089821, alpha: 1)
                self.fourButton.setTitleColor(UIColor.white, for: .normal)
            } else {
                self.fourButton.backgroundColor = #colorLiteral(red: 0.9983076453, green: 0.386271596, blue: 0.4940415621, alpha: 1)
                self.fourButton.setTitleColor(UIColor.white, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.fourButton.backgroundColor = Resources.Colors.backgroundButtonColor
                self.fourButton.setTitleColor(UIColor.gray, for: .normal)
                self.onVariantChanged?()
            }
        }
    }
}
