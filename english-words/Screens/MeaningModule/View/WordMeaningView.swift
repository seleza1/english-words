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
    private let numberWordLabel = UILabel()

    // MARK: - Public

    var onTappNextButtonWord: (() -> Void)?
    var onActionClose: (() -> Void)?
    var speak: ((_ word: String) -> Void)?

    var data: ((_ word: String,_ translate: String) -> Void)?

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupActions()
        setupConstraints()
        onVoice()
    }

    func configureScreen(word: String, translate: String) {
        stickerView.worldLabel.text = word
        stickerView.translationLabel.text = translate
        stickerView.hintButton.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

private extension WordMeaningView {

    func setupView() {
        addSubview(closeButton)
        addSubview(stickerView)
        addSubview(nextButton)
        addSubview(numberWordLabel)

        nextButton.setTitleColor(.designSystemBlack, for: .normal)
        nextButton.backgroundColor = .designSystemYellow
        nextButton.layer.cornerRadius = 32
        nextButton.setTitle(.nextWord, for: .normal)

        stickerView.backgroundColor = .designSystemMint

        closeButton.setImage(.chevronImage, for: .normal)

        numberWordLabel.textAlignment = .center

        backgroundColor = .designSystemWhite
  }

    func setupActions() {
        closeButton.addTarget(self, action: #selector(onTappCloseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(onTappNextButton), for: .touchUpInside)
    }

    @objc func onTappCloseButton() {
        onActionClose?()
    }

    @objc func onTappNextButton() {
        onTappNextButtonWord?()
    }

    func onVoice() {
        stickerView.onVoice = { [weak self] in
            self?.speak?(self?.stickerView.worldLabel.text ?? "Не читается")
        }
    }

    func setupConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 61),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            closeButton.heightAnchor.constraint(equalToConstant: 28)
        ])

        numberWordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberWordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            numberWordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 280),
            numberWordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            numberWordLabel.heightAnchor.constraint(equalToConstant: 22)
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
    }
}
