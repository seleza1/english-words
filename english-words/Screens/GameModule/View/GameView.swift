//
//  GameView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class GameView: UIView {

    // MARK: - Private

    private var word: WordModel?

    private let stickerView = StickerView()

    private let stackView = UIStackView()

    private let numberWordLabel = UILabel()

    // MARK: - Public

    var onVariantChanged: (() -> ())?
    var oneTappCloseButton: (() -> ())?
    var onAction: (() -> ())?

    let closeButton = UIButton()

    let oneButton = Button(style: .one)
    let twoButton = Button(style: .two)
    let threeButton = Button(style: .three)
    let fourButton = Button(style: .four)

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
        setupActions()

        numberWordLabel.text = "1 /4900"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(_ word: WordModel) {

        self.word = word

        let model = StickerViewModel(
            word: word.word.capitalized,
            translation: nil,
            showHintButton: true,
            backgroundColor: .designSystemSky
        )

        stickerView.configure(with: model)

        oneButton.setTitle(word.variants[0].capitalized, for: .normal)
        twoButton.setTitle(word.variants[1].capitalized, for: .normal)
        threeButton.setTitle(word.variants[2].capitalized, for: .normal)
        fourButton.setTitle(word.variants[3].capitalized, for: .normal)
    }
}

// MARK: - Extension

private extension GameView {

    func setupViews() {
        backgroundColor = .designSystemWhite

        addSubview(closeButton)
        addSubview(oneButton)
        addSubview(threeButton)
        addSubview(fourButton)
        addSubview(twoButton)
        addSubview(stackView)
        addSubview(numberWordLabel)
        addSubview(stickerView)

        stackView.addArrangedSubview(oneButton)
        stackView.addArrangedSubview(twoButton)
        stackView.addArrangedSubview(threeButton)
        stackView.addArrangedSubview(fourButton)

        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 12

        closeButton.setImage(.chevronImage, for: .normal)
        closeButton.addTarget(self, action: #selector(oneTappCloseButtons), for: .touchUpInside)

        numberWordLabel.textAlignment = .center
    }

    @objc func onActions() {
        onAction?()
    }

    @objc func oneTappCloseButtons() {
        oneTappCloseButton?()
    }

    func setupConstraints() {

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 61),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            closeButton.heightAnchor.constraint(equalToConstant: 28)
        ])

        numberWordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberWordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            numberWordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 280),
            numberWordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            numberWordLabel.heightAnchor.constraint(equalToConstant: 22)
        ])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ])

        stickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stickerView.topAnchor.constraint(equalTo: topAnchor, constant: 117),
            stickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stickerView.heightAnchor.constraint(equalToConstant: 240)
        ])

        NSLayoutConstraint.activate([
            oneButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 1),
            oneButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1),
            oneButton.heightAnchor.constraint(equalToConstant: 54),

            twoButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 1),
            twoButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1),
            twoButton.heightAnchor.constraint(equalToConstant: 54),

            threeButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 1),
            threeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1),
            threeButton.heightAnchor.constraint(equalToConstant: 54),

            fourButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 1),
            fourButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1),
            fourButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }

    func setupActions() {
        oneButton.onAction = {

            if self.word?.variants[0] == self.word?.translate {
                self.oneButton.backgroundColor = .designSystemGreen
                self.oneButton.setTitleColor(.designSystemWhite, for: .normal)
            } else {
                self.oneButton.backgroundColor = .designSystemRose
                self.oneButton.setTitleColor(.designSystemWhite, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.oneButton.backgroundColor = .designSystemWhite
                self.oneButton.setTitleColor(.designSystemGrey, for: .normal)
                self.onVariantChanged?()
            }
        }

        twoButton.onAction = {
            
            if self.word?.variants[1] == self.word?.translate {
                self.twoButton.backgroundColor = .designSystemGreen
                self.twoButton.setTitleColor(.designSystemWhite, for: .normal)
            } else {
                self.twoButton.backgroundColor = .designSystemRose
                self.twoButton.setTitleColor(.designSystemWhite, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.twoButton.backgroundColor = .designSystemWhite
                self.twoButton.setTitleColor(.designSystemGrey, for: .normal)
                self.onVariantChanged?()
            }
        }

        threeButton.onAction = {

            if self.word?.variants[2] == self.word?.translate {
                self.threeButton.backgroundColor = .designSystemGreen
                self.threeButton.setTitleColor(.designSystemWhite, for: .normal)
            } else {
                self.threeButton.backgroundColor = .designSystemRose
                self.threeButton.setTitleColor(.designSystemWhite, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.threeButton.backgroundColor = .designSystemWhite
                self.threeButton.setTitleColor(.designSystemGrey, for: .normal)
                self.onVariantChanged?()
            }
        }

        fourButton.onAction = {

            if self.word?.variants[3] == self.word?.translate {
                self.fourButton.backgroundColor = .designSystemGreen
                self.fourButton.setTitleColor(.designSystemWhite, for: .normal)
            } else {
                self.fourButton.backgroundColor = .designSystemRose
                self.fourButton.setTitleColor(.designSystemWhite, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.fourButton.backgroundColor = .designSystemWhite
                self.fourButton.setTitleColor(.designSystemGrey, for: .normal)
                self.onVariantChanged?()
            }
        }
    }
}
