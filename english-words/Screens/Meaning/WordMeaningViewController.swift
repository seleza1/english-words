//
//  WordMeaningViewController.swift
//  english-words
//
//  Created by user on 11.05.2023.
//

import UIKit

final class WordMeaningViewController: UIViewController {

    private let stickerView = StickerView()

    private let closeButton = UIButton()
    private let nextButton = UIButton()

    let wordLabel = UILabel()
    let translateLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupActions()
        setupConstraints()
    }
}

// MARK: - Extension

private extension WordMeaningViewController {

    func setupView() {
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(stickerView)
        view.addSubview(nextButton)

        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.backgroundColor = .designSystemYellow
        nextButton.layer.cornerRadius = 32
        nextButton.setTitle(.continueToLearnButtonTitle, for: .normal)

        stickerView.backgroundColor = .designSystemSky
        stickerView.addSubview(wordLabel)
        stickerView.addSubview(translateLabel)

        wordLabel.font = .stickerWorldLabelFont
        wordLabel.textColor = .designSystemBlack
        wordLabel.textAlignment = .center

        translateLabel.font = .translationLabelFont
        translateLabel.textColor = .designSystemGrey
        translateLabel.textAlignment = .center
        translateLabel.numberOfLines = 0

        closeButton.setImage(UIImage.chevronImage, for: .normal)

    }
    
    func setupActions() {
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }

    func setupConstraints() {
        stickerView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        translateLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 61),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            closeButton.heightAnchor.constraint(equalToConstant: 28),

            stickerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 117),
            stickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stickerView.heightAnchor.constraint(equalToConstant: 240),

            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 64),

            wordLabel.topAnchor.constraint(equalTo: stickerView.topAnchor, constant: 86),
            wordLabel.leadingAnchor.constraint(equalTo: stickerView.leadingAnchor, constant: 70),
            wordLabel.trailingAnchor.constraint(equalTo: stickerView.trailingAnchor, constant: -70),

            translateLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 24),
            translateLabel.leadingAnchor.constraint(equalTo: stickerView.leadingAnchor, constant: 70),
            translateLabel.trailingAnchor.constraint(equalTo: stickerView.trailingAnchor, constant: -70)
        ])
    }
        
    @objc func closeView() {
        dismiss(animated: true)
    }
}
