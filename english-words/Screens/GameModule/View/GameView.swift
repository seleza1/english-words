//
//  GameView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class GameView: UIView {

    // MARK: - Private

    private var word: GameModel?

    private let stackView = UIStackView()
    private let closeButton = UIButton()
    private let numberWordLabel = UILabel()

    private let stickerView = StickerView()
    private var variantButtons: [VariantButton] = []

    // MARK: - Public

    var onTapVoice: (() -> Void)?
    var onTapHint: (() -> Void)?
    var onVariantChanged: (() -> Void)?
    var oneTapCloseButton: (() -> Void)?
    var onSelectVariant: ((_ variant: String) -> Void)?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        setupAddTarget()
        setupVoice()
        setupHint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func display(word: String, as correct: Bool) {
        variantButtons.forEach { button in
            if button.title(for: .normal) == word.capitalized {
                button.variantState = correct ? .right : .wrong
            }
        }
    }

    func displayHint(variant: String) {
        variantButtons.forEach { button in
            if button.title(for: .normal) == variant.capitalized {
                button.variantState = .right
            }
        }
    }

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
            setupActions(button: button, variant: variant)
        }
        setNeedsLayout()
        layoutIfNeeded()
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
        oneTapCloseButton?()
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

    func setupActions(button: VariantButton, variant: String) {
        button.onTap = { [weak self] in
            self?.onSelectVariant?(variant)
        }
    }

    func setupHint() {
        stickerView.onHint = { [weak self] in
            self?.onTapHint?()
        }
    }

    func setupVoice() {
        stickerView.onVoice = { [weak self] in
            self?.onTapVoice?()
        }
    }
}
