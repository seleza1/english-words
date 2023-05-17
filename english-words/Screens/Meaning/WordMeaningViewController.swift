//
//  WordMeaningViewController.swift
//  english-words
//
//  Created by user on 11.05.2023.
//

import UIKit

final class WordMeaningViewController: UIViewController {

    private let closeButton = Button(style: .close)

    let wordLabelMeaning = Label(style: .wordMeaning)
    let wordLabelTranslate = Label(style: .translate)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
        setupActions()
    }
}

// MARK: - Extension

private extension WordMeaningViewController {

    func setupView() {
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(wordLabelTranslate)
        view.addSubview(wordLabelMeaning)
    }
    
    func setupActions() {
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            wordLabelMeaning.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            wordLabelMeaning.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),

            wordLabelTranslate.topAnchor.constraint(equalTo: view.topAnchor, constant: 155),
            wordLabelTranslate.leadingAnchor.constraint(equalTo: wordLabelMeaning.trailingAnchor, constant: 64),
        ])
    }
        
    @objc func closeView() {
        dismiss(animated: true)
    }
}
