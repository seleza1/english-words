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
        setupStackView()
        buttonsTapped()
        setupStickerView()
        
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
            backgroundColor: .designSystemSky ?? UIColor.white
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
        addSubview(closeButton)
        addSubview(oneButton)
        addSubview(threeButton)
        addSubview(fourButton)
        addSubview(twoButton)
        addSubview(stackView)
        addSubview(numberWordLabel)
        addSubview(stickerView)

        closeButton.setImage(UIImage.chevronImage, for: .normal)
        closeButton.addTarget(self, action: #selector(oneTappCloseButtons), for: .touchUpInside)

        numberWordLabel.textAlignment = .center

        backgroundColor = .white
    }

    @objc func onActions() {
        onAction?()
    }

    @objc func oneTappCloseButtons() {
        oneTappCloseButton?()
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

    func setupStickerView() {
        stickerView.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        numberWordLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 61),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            closeButton.heightAnchor.constraint(equalToConstant: 28),

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

            numberWordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            numberWordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 280),
            numberWordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            numberWordLabel.heightAnchor.constraint(equalToConstant: 22),

            stickerView.topAnchor.constraint(equalTo: topAnchor, constant: 117),
            stickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stickerView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }

    func buttonsTapped() {
        oneButton.onAction = {

            if self.word?.variants[0] == self.word?.translate {
                self.oneButton.backgroundColor = .designSystemGreen
                self.oneButton.setTitleColor(UIColor.white, for: .normal)
            } else {
                self.oneButton.backgroundColor = .designSystemRose
                self.oneButton.setTitleColor(UIColor.white, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.oneButton.backgroundColor = .designSystemWhite
                self.oneButton.setTitleColor(UIColor.designSystemGrey, for: .normal)
                self.onVariantChanged?()
            }
        }

        twoButton.onAction = {
            
            if self.word?.variants[1] == self.word?.translate {
                self.twoButton.backgroundColor = .designSystemGreen
                self.twoButton.setTitleColor(UIColor.designSystemWhite, for: .normal)
            } else {
                self.twoButton.backgroundColor = .designSystemRose
                self.twoButton.setTitleColor(UIColor.designSystemWhite, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.twoButton.backgroundColor = .designSystemWhite
                self.twoButton.setTitleColor(UIColor.designSystemGrey, for: .normal)
                self.onVariantChanged?()
            }
        }

        threeButton.onAction = {

            if self.word?.variants[2] == self.word?.translate {
                self.threeButton.backgroundColor = .designSystemGreen
                self.threeButton.setTitleColor(UIColor.designSystemWhite, for: .normal)
            } else {
                self.threeButton.backgroundColor = .designSystemRose
                self.threeButton.setTitleColor(UIColor.designSystemWhite, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.threeButton.backgroundColor = .designSystemWhite
                self.threeButton.setTitleColor(UIColor.designSystemGrey, for: .normal)
                self.onVariantChanged?()
            }
        }

        fourButton.onAction = {

            if self.word?.variants[3] == self.word?.translate {
                self.fourButton.backgroundColor = .designSystemGreen
                self.fourButton.setTitleColor(UIColor.designSystemWhite, for: .normal)
            } else {
                self.fourButton.backgroundColor = .designSystemRose
                self.fourButton.setTitleColor(UIColor.designSystemWhite, for: .normal)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.fourButton.backgroundColor = .designSystemWhite
                self.fourButton.setTitleColor(UIColor.designSystemGrey, for: .normal)
                self.onVariantChanged?()
            }
        }
    }
}
