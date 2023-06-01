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

    private let worldLabel = UILabel()
    private let translationLabel = UILabel()

    private let hintButton = UIButton()
    private let speakerButton = UIButton()

    // MARK: - Public

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
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
