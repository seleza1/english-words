//
//  StickerView.swift
//  english-words
//
//  Created by user on 18.05.2023.
//

import UIKit

final class StickerView: UIView {

    // MARK: - Private

    private let worldLabel = UILabel()
    let translationLabel = UILabel()

    private let hintButton = UIButton()
    private let speakerButton = UIButton()

    let hintView = UIView()
    private let speakerView = UIView()

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


        if viewModel.showHintButton {
            translationLabel.isHidden = true
            hintView.isHidden = false

            NSLayoutConstraint.activate([
                worldLabel.topAnchor.constraint(equalTo: topAnchor, constant: 109),
                worldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
                worldLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70)
            ])
        } else {
            translationLabel.isEnabled = false
            hintView.isHidden = true

            NSLayoutConstraint.activate([
                worldLabel.topAnchor.constraint(equalTo: topAnchor, constant: 86),
                worldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
                worldLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
                worldLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),

                translationLabel.topAnchor.constraint(equalTo: worldLabel.bottomAnchor, constant: 24),
                translationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
                translationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            ])
        }
    }
}

private extension StickerView {

    func setupView() {
        layer.cornerRadius = 12

        worldLabel.font = UIFont.systemFont(ofSize: 32, weight: .medium)
        worldLabel.textColor = .designSystemBlack
        worldLabel.textAlignment = .center

        translationLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        translationLabel.textColor = .designSystemGray
        translationLabel.textAlignment = .center

        speakerButton.setImage(UIImage.soundSpeakerImage, for: .normal)
        hintButton.setImage(UIImage.keyImage, for: .normal)

        hintView.layer.cornerRadius = 22
        hintView.backgroundColor = .white
        speakerView.layer.cornerRadius = 22
        speakerView.backgroundColor = .white

        addSubview(hintView)
        addSubview(speakerView)

        hintView.addSubview(hintButton)
        speakerView.addSubview(speakerButton)

        addSubview(worldLabel)
        addSubview(translationLabel)

    }

    func setupConstraints() {
        worldLabel.translatesAutoresizingMaskIntoConstraints = false
        translationLabel.translatesAutoresizingMaskIntoConstraints = false
        speakerButton.translatesAutoresizingMaskIntoConstraints = false
        hintButton.translatesAutoresizingMaskIntoConstraints = false
        hintView.translatesAutoresizingMaskIntoConstraints = false
        speakerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            worldLabel.topAnchor.constraint(equalTo: topAnchor, constant: 109),
            worldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            worldLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            worldLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),

            translationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -86),
            translationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            translationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),

            speakerView.topAnchor.constraint(equalTo: topAnchor, constant: 180),
            speakerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 275),
            speakerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            speakerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            speakerView.heightAnchor.constraint(equalToConstant: 48),

            speakerButton.topAnchor.constraint(equalTo: speakerView.topAnchor, constant: 12),
            speakerButton.leadingAnchor.constraint(equalTo: speakerView.leadingAnchor, constant: 12),
            speakerButton.trailingAnchor.constraint(equalTo: speakerView.trailingAnchor, constant: -12),
            speakerButton.bottomAnchor.constraint(equalTo: speakerView.bottomAnchor, constant: -12),

            hintView.topAnchor.constraint(equalTo: topAnchor, constant: 180),
            hintView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 214),
            hintView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -73),
            hintView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            hintView.heightAnchor.constraint(equalToConstant: 48),

            hintButton.topAnchor.constraint(equalTo: hintView.topAnchor, constant: 12),
            hintButton.leadingAnchor.constraint(equalTo: hintView.leadingAnchor, constant: 12),
            hintButton.trailingAnchor.constraint(equalTo: hintView.trailingAnchor, constant: -12),
            hintButton.bottomAnchor.constraint(equalTo: hintView.bottomAnchor, constant: -12)
        ])

    }
}
