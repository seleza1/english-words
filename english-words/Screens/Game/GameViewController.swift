//
//  GameViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

class GameViewController: UIViewController {

    private var total = 0

    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(gotToVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let indicatorProgress: UIProgressView = {
        let indicatorProgress = UIProgressView()
        indicatorProgress.translatesAutoresizingMaskIntoConstraints = false

        return indicatorProgress
    }()

    private let selectAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите правильный ответ"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let uiView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9741126895, green: 0.9580762982, blue: 0.7994511127, alpha: 1)
        view.layer.cornerRadius = 9
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let wordLabel: UILabel = {
        let label = UILabel()
        label.text = "shift"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let hintButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "lightbulb"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529412389, green: 0.9529411197, blue: 0.9529412389, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let oneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Пейзаж", for: .normal)
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529412389, green: 0.9529411197, blue: 0.9529412389, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выравнивание", for: .normal)
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529412389, green: 0.9529411197, blue: 0.9529412389, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let twoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Перемещение", for: .normal)
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529412389, green: 0.9529411197, blue: 0.9529412389, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let threeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сдвиг", for: .normal)
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529412389, green: 0.9529411197, blue: 0.9529412389, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()

    }

    @objc private func gotToVC() {
        dismiss(animated: true)
    }
}

extension GameViewController {
    private func setupViews() {
        view.addSubview(backButton)
        view.addSubview(indicatorProgress)
        view.addSubview(selectAnswerLabel)
        view.addSubview(uiView)
        view.addSubview(oneButton)
        view.addSubview(twoButton)
        view.addSubview(threeButton)
        view.addSubview(secondButton)
        uiView.addSubview(wordLabel)
        uiView.addSubview(hintButton)
        view.backgroundColor = .white

        indicatorProgress.setProgress(Float(total), animated: true)

    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 9),

            indicatorProgress.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            indicatorProgress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 82),
            indicatorProgress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -82),
            indicatorProgress.heightAnchor.constraint(equalToConstant: 6),

            selectAnswerLabel.topAnchor.constraint(equalTo: indicatorProgress.bottomAnchor, constant: 9),
            selectAnswerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            selectAnswerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            uiView.topAnchor.constraint(equalTo: selectAnswerLabel.bottomAnchor, constant: 9),
            uiView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            uiView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            uiView.heightAnchor.constraint(equalToConstant: 223),

            wordLabel.topAnchor.constraint(equalTo: uiView.topAnchor, constant: 64),
            wordLabel.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 32),
            wordLabel.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: -32),

            hintButton.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: -6),
            hintButton.bottomAnchor.constraint(equalTo: uiView.bottomAnchor, constant: -6),

            oneButton.topAnchor.constraint(equalTo: uiView.bottomAnchor, constant: 52),
            oneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            oneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            oneButton.heightAnchor.constraint(equalToConstant: 44),

            secondButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: 9),
            secondButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            secondButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            secondButton.heightAnchor.constraint(equalToConstant: 44),

            twoButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 9),
            twoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            twoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            twoButton.heightAnchor.constraint(equalToConstant: 44),

            threeButton.topAnchor.constraint(equalTo: twoButton.bottomAnchor, constant: 9),
            threeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            threeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            threeButton.heightAnchor.constraint(equalToConstant: 44),



        ])
    }
}
