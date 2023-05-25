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

        worldLabel.font = .stickerWorldLabelFont
        worldLabel.textColor = .designSystemBlack
        worldLabel.textAlignment = .center

        translationLabel.font = .translationLabelFont
        translationLabel.textColor = .designSystemGrey
        translationLabel.textAlignment = .center

        speakerButton.setImage(UIImage.soundSpeakerImage, for: .normal)
        speakerButton.layer.cornerRadius = 22
        speakerButton.backgroundColor = UIColor.white

        hintButton.setImage(UIImage.keyImage, for: .normal)
        hintButton.layer.cornerRadius = 22
        hintButton.backgroundColor = UIColor.white
    }

    func setupConstraints() {
        worldLabel.translatesAutoresizingMaskIntoConstraints = false
        translationLabel.translatesAutoresizingMaskIntoConstraints = false
        speakerButton.translatesAutoresizingMaskIntoConstraints = false
        hintButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),

            speakerButton.topAnchor.constraint(equalTo: topAnchor, constant: 180),
            speakerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 275),
            speakerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            speakerButton.heightAnchor.constraint(equalToConstant: 48),

            hintButton.topAnchor.constraint(equalTo: topAnchor, constant: 180),
            hintButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 214),
            hintButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -73),
            hintButton.heightAnchor.constraint(equalToConstant: 48)
        ])

    }
}
