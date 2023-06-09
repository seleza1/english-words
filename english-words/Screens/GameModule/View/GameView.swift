//
//  GameView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit
import AVFoundation

final class GameView: UIView {

    // MARK: - Private

    private let stickerView = StickerView()

    private let stackView = UIStackView()

    private let numberWordLabel = UILabel()

    // MARK: - Public

    var word: GameModel?

    var onVariantChanged: (() -> Void)?
    var oneTappCloseButton: (() -> Void)?
    var onAction: (() -> Void)?
    var updateWord: ((_ wordId: Int, _ status: Word.Status) ->Void)?

    let closeButton = UIButton()

    var variantButtons: [VariantButton] = []

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupAddTarget()
        showHint()
        speakWord()
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
            button.setTitle(variant.capitalized, for: .normal)
            variantButtons.append(button)
            stackView.addArrangedSubview(button)

            button.backgroundColor = .designSystemWhite
            button.setTitleColor(.designSystemGrey, for: .normal)
            button.layer.cornerRadius = 12
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.designSystemWhiteSky.cgColor
            button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)

            configureVariantButtonLayout(button: button)
            setupActions(button: button, index: index)

            setNeedsLayout()
            layoutIfNeeded()
        }
    }
}

// MARK: - Private Methods

private extension GameView {

    func speakWord() {
        stickerView.onVoice = {
            guard let word = self.stickerView.worldLabel.text else { return }

            let synthesizer = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: word)
            utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.eloquence.en-US.Eddy")
            synthesizer.speak(utterance)
        }
    }

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
            button.heightAnchor.constraint(equalToConstant: 54),
        ])
    }

    func setupActions(button: VariantButton, index: Int) {

        button.onAction = { [weak self] in
            if self?.word?.variants[index] == self?.word?.translate {
                button.variantStateRight = .right
                if let word = self?.word {
                    self?.updateWord?(word.id, .learned)
                }
            } else {
                button.variantStateWrong = .wrong
                if let word = self?.word {
                    self?.updateWord?(word.id, .learning)
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                button.variantStateWrong = .unknown
                self?.onVariantChanged?()
            }
        }
    }

    // MARK: - Hint

    func showHint() {
        stickerView.onHint = { [weak self] in
            if self?.word?.variants[0] == self?.word?.translate {
                self?.showHints(button: self!.variantButtons[0])
            } else if self?.word?.variants[1] == self?.word?.translate {
                self?.showHints(button: self!.variantButtons[1])
            } else if self?.word?.variants[2] == self?.word?.translate {
                self?.showHints(button: self!.variantButtons[2])
            } else if self?.word?.variants[3] == self?.word?.translate {
                self?.showHints(button: self!.variantButtons[3])
            }
        }
    }

    func showHints(button: VariantButton) {
        button.backgroundColor = .designSystemGreen
        button.setTitleColor(.designSystemWhite, for: .normal)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            button.backgroundColor = .designSystemWhite
            button.setTitleColor(.designSystemGrey, for: .normal)
            self.onVariantChanged?()
        }
    }

}
