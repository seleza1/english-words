//
//  GameView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class GameView: UIView {

    // MARK: - Private

    private let stackView = UIStackView()
    private let closeButton = UIButton()
    private let numberWordLabel = UILabel()

    // MARK: - Public

    let stickerView = StickerView()

    var word: GameModel?

    var onVariantChanged: (() -> Void)?
    var oneTappCloseButton: (() -> Void)?
    var onAction: (() -> Void)?

    var updateHint: (() -> Void)?

    var updateWord: ((_ wordId: Int, _ status: Word.Status) -> Void)?
    var updateButton: ((_ button: VariantButton,_ index: Int) -> Void)?
    var updateVoice: ((_ word: String) -> Void)?

    var variantButtons: [VariantButton] = []

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupAddTarget()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(word: GameModel, number: Int, index: Int) {
        self.word = word
        numberWordLabel.text = "\(number)/ \(index)"

        let model = StickerViewModel(
            word: word.word.capitalized,
            translation: nil,
            showHintButton: true,
            backgroundColor: .designSystemSky
        )

        stickerView.configure(with: model)

        variantButtons.forEach { button in
            stackView.removeArrangedSubview(button)
        }

        variantButtons.removeAll()

        word.variants.enumerated().forEach { index, variant in
            let button = VariantButton()
            variantButtons.append(button)
            stackView.addArrangedSubview(button)

            button.setTitle(variant.capitalized, for: .normal)
            button.variantState = .unknown
            
            configureVariantButtonLayout(button: button)
            setupActions(button: button, index: index)
            speakWord(word: stickerView.worldLabel.text ?? "error")
            showHint()

            setNeedsLayout()
            layoutIfNeeded()
        }
    }
}

// MARK: - Private Methods

private extension GameView {

    // MARK: - Setup

    func setupViews() {
        backgroundColor = .designSystemWhite

        addSubview(closeButton)
        addSubview(stackView)
        addSubview(numberWordLabel)
        addSubview(stickerView)

        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 12

        closeButton.setImage(.chevronImage, for: .normal)

        numberWordLabel.textAlignment = .center
    }

    func setupAddTarget() {
        closeButton.addTarget(self, action: #selector(oneTappCloseButtons), for: .touchUpInside)
    }

    @objc func oneTappCloseButtons() {
        oneTappCloseButton?()
    }

    func setupConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 61),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
        ])

        numberWordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberWordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            numberWordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])

        stickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stickerView.topAnchor.constraint(equalTo: topAnchor, constant: 117),
            stickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stickerView.heightAnchor.constraint(equalToConstant: 240),
        ])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
        ])
    }

    func configureVariantButtonLayout(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 54)
        ])
    }

    func setupActions(button: VariantButton, index: Int) {
        updateButton?(button, index)
    }

    // MARK: - Speak

    func speakWord(word: String) {
        updateVoice?(word)
    }
    // MARK: - Hint

    func showHint() {
        updateHint?()
    }
}
