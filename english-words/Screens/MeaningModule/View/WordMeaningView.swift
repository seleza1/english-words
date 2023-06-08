//
//  WordMeaningView.swift
//  english-words
//
//  Created by user on 26.05.2023.
//

import UIKit

final class WordMeaningView: UIView {

    // MARK: - Private

    private let stickerView = StickerView()

    private let closeButton = UIButton()
    private let nextButton = UIButton()

    // MARK: - Public

    let wordLabel = UILabel()
    let translateLabel = UILabel()

    var onAction: (() -> Void)?
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupActions()
        setupConstraints()
        
        self.backgroundColor = .designSystemWhite
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

private extension WordMeaningView {

    func setupView() {
        backgroundColor = .white

        addSubview(closeButton)
        addSubview(stickerView)
        addSubview(nextButton)

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

        closeButton.setImage(.chevronImage, for: .normal)
    }

    func setupActions() {
        closeButton.addTarget(self, action: #selector(onTappCloseButton), for: .touchUpInside)
    }

    @objc func onTappCloseButton() {
        onAction?()
    }

    func setupConstraints() {
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 61),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            closeButton.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        stickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stickerView.topAnchor.constraint(equalTo: topAnchor, constant: 117),
            stickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stickerView.heightAnchor.constraint(equalToConstant: 240)
        ])
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: stickerView.topAnchor, constant: 86),
            wordLabel.leadingAnchor.constraint(equalTo: stickerView.leadingAnchor, constant: 70),
            wordLabel.trailingAnchor.constraint(equalTo: stickerView.trailingAnchor, constant: -70)
        ])
        
        translateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            translateLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 24),
            translateLabel.leadingAnchor.constraint(equalTo: stickerView.leadingAnchor, constant: 70),
            translateLabel.trailingAnchor.constraint(equalTo: stickerView.trailingAnchor, constant: -70)
        ])
    }
}
