//
//  GameViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

class GameViewController: UIViewController {

    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(gotToVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let indicatorProgress: UIProgressView = {
        let indicatorProgress = UIProgressView()
        indicatorProgress.translatesAutoresizingMaskIntoConstraints = false

        return indicatorProgress
    }()

    private let oneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let secondButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let twoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let threeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()

    }

    @objc func gotToVC() {
        dismiss(animated: true)
    }
}

extension GameViewController {
    private func setupViews() {
        view.addSubview(wordLabel)
        view.addSubview(imageView)
        view.addSubview(backButton)
        view.addSubview(indicatorProgress)
        view.backgroundColor = .white
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 9),

            indicatorProgress.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            indicatorProgress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            indicatorProgress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            indicatorProgress.heightAnchor.constraint(equalToConstant: 6)
        ])
    }
}
