//
//  StickerView.swift
//  english-words
//
//  Created by user on 18.05.2023.
//

import UIKit

final class StickerView: UIView {

    // MARK: - Private

    private let stackView = UIStackView()

    // MARK: - Public

    let worldLabel = UILabel()
    let translationLabel = UILabel()
    let speakerButton = UIButton()
    let hintButton = UIButton()

    var onHint: (()-> Void)?
    var onVoice: (()-> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
        setupActions()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StickerView {

    func configure(with viewModel: StickerViewModel) {
        worldLabel.text = viewModel.word
        translationLabel.text = viewModel.translation
        backgroundColor = viewModel.backgroundColor
    }
}

// MARK: - Private Methods

private extension StickerView {

    func setupView() {
        layer.cornerRadius = 12

        addSubview(speakerButton)
        addSubview(hintButton)
        addSubview(stackView)

        stackView.addArrangedSubview(worldLabel)
        stackView.addArrangedSubview(translationLabel)

        stackView.spacing = 24
        stackView.axis = .vertical

        worldLabel.font = .stickerWorldLabelFont
        worldLabel.textColor = .designSystemBlack
        worldLabel.textAlignment = .center

        translationLabel.font = .translationLabelFont
        translationLabel.textColor = .designSystemGrey
        translationLabel.textAlignment = .center

        speakerButton.setImage(.soundSpeakerImage, for: .normal)
        speakerButton.layer.cornerRadius = 22
        speakerButton.backgroundColor = .designSystemWhite

        hintButton.setImage(.keyImage, for: .normal)
        hintButton.layer.cornerRadius = 22
        hintButton.backgroundColor = .designSystemWhite

    }

    func setupActions() {
        hintButton.addTarget(self, action: #selector(onTappHintButton), for: .touchUpInside)
        speakerButton.addTarget(self, action: #selector(onTappVoiceButton), for: .touchUpInside)
    }

    @objc func onTappHintButton() {
        onHint?()
    }

    @objc func onTappVoiceButton() {
        onVoice?()
    }

    func setupConstraints() {
        worldLabel.translatesAutoresizingMaskIntoConstraints = false
        translationLabel.translatesAutoresizingMaskIntoConstraints = false

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        speakerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            speakerButton.topAnchor.constraint(equalTo: topAnchor, constant: 180),
            speakerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            speakerButton.heightAnchor.constraint(equalToConstant: 48),
            speakerButton.widthAnchor.constraint(equalToConstant: 48)
        ])

        hintButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hintButton.topAnchor.constraint(equalTo: topAnchor, constant: 180),
            hintButton.trailingAnchor.constraint(equalTo: speakerButton.leadingAnchor, constant: -13),
            hintButton.heightAnchor.constraint(equalToConstant: 48),
            hintButton.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
}
