//
//  StudyingView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit
import Lottie

final class StudyingView: UIView {

    // MARK: - Private

    private let progressView = UIProgressView()
    private let wordCountLabel = UILabel()
    private let noWordsCountLabel = UILabel()
    private let continueToLearnButton = UIButton()

    private var animationView = LottieAnimationView()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WordTableViewCell.self, forCellReuseIdentifier: WordTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 104
        tableView.separatorStyle = .none

        return tableView
    }()

    private var words: [Word] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Public

    var oneTapLearnButton: (() -> Void)?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(_ words: [Word]) {
        self.words = words

        updateAnimation()

        progressView.progress = Float(words.count) / Float(5000)
        wordCountLabel.text = "\(words.count) слов"
    }
}

// MARK: - Extension Table View Data Source, UITableViewDelegate

extension StudyingView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordTableViewCell.reuseId, for: indexPath) as! WordTableViewCell

        let model = WordTableViewCellModel(word: words[indexPath.item].word, isLearned: false)

        cell.configure(model)
        cell.selectionStyle = .none

        return cell
    }
}

// MARK: - Private Methods

private extension StudyingView {

    func setupViews() {
        addSubview(tableView)
        addSubview(continueToLearnButton)
        addSubview(progressView)
        addSubview(wordCountLabel)
        addSubview(noWordsCountLabel)

        continueToLearnButton.setTitle(.continueToLearnButtonTitle, for: .normal)
        continueToLearnButton.setTitleColor(.designSystemWhite, for: .normal)
        continueToLearnButton.titleLabel?.font = .wordLabelMin
        continueToLearnButton.backgroundColor = .designSystemBlue
        continueToLearnButton.layer.cornerRadius = 33
        continueToLearnButton.addTarget(self, action: #selector(onActionsLearnButton), for: .touchUpInside)

        progressView.progressTintColor = .designSystemOrange
        progressView.layer.cornerRadius = 12
        progressView.trackTintColor = .designSystemWhite

        noWordsCountLabel.text = .noWordsLearning
        noWordsCountLabel.font = .wordLabelFont

        backgroundColor = .designSystemWhite
    }

    @objc func onActionsLearnButton() {
        oneTapLearnButton?()
    }

    func updateAnimation() {
        if words.isEmpty {
            continueToLearnButton.backgroundColor = .designSystemLightWhite
            continueToLearnButton.setTitleColor(.designSystemGrey, for: .normal)
            continueToLearnButton.isEnabled = false
            noWordsCountLabel.isHidden = false
            setupAnimationView()
        } else {
            continueToLearnButton.isEnabled = true
            continueToLearnButton.backgroundColor = .designSystemBlue
            continueToLearnButton.setTitleColor(.designSystemWhite, for: .normal)
            noWordsCountLabel.isHidden = true
            animationView.isHidden = true
        }
    }

    func setupAnimationView() {
        animationView.removeFromSuperview()
        animationView = .init(name: .tea)
        animationView.frame = bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        animationView.play()
        addSubview(animationView)
    }

    func setupConstraints() {
        wordCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wordCountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 65),
            wordCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])

        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 72),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: wordCountLabel.leadingAnchor, constant: -24),
            progressView.heightAnchor.constraint(equalToConstant: 8)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        noWordsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noWordsCountLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 50),
            noWordsCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            noWordsCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        continueToLearnButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continueToLearnButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            continueToLearnButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            continueToLearnButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            continueToLearnButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
