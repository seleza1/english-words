//
//  KnownView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit
import Lottie

final class KnownView: UIView {

    // MARK: - Private

    private let progressView = UIProgressView()
    private let wordLabelCount = UILabel()
    private let noWordsCountLabel = UILabel()

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

    var wordMeaning: ((_ word: String,_ translate: String) -> Void)?

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

        updateAnimation(words: words)
        
        progressView.progress = Float(words.count) / Float(5000)
        wordLabelCount.text = "\(words.count) слов"
    }
}

// MARK: - Extension Table View Data Source, UITableViewDelegate

extension KnownView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordTableViewCell.reuseId, for: indexPath) as! WordTableViewCell

        let model = WordTableViewCellModel(word: words[indexPath.item].word, isLearned: true)

        cell.configure(model)
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let word = words[indexPath.item]
        wordMeaning?(word.word, word.translate)
    }
}

// MARK: - Private Methods

private extension KnownView {

    func setupViews() {
        addSubview(tableView)
        addSubview(progressView)
        addSubview(wordLabelCount)
        addSubview(noWordsCountLabel)

        progressView.progressTintColor = .designSystemGreen
        progressView.layer.cornerRadius = 12
        progressView.trackTintColor = .designSystemWhite

        noWordsCountLabel.text = .noWordsKnown
        noWordsCountLabel.font = .wordLabelFont

        backgroundColor = .designSystemWhite
    }

    func setupAnimationView() {
        animationView = .init(name: .star)
        animationView.frame = bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        addSubview(animationView)
    }

    func updateAnimation(words: [Word]) {
        if words.isEmpty {
            noWordsCountLabel.isHidden = false
            animationView.play()
            setupAnimationView()
        } else {
            noWordsCountLabel.isHidden = true
            animationView.stop()
            animationView.isHidden = true
        }
    }

    func setupConstraints() {
        wordLabelCount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wordLabelCount.topAnchor.constraint(equalTo: topAnchor, constant: 65),
            wordLabelCount.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])

        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 72),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: wordLabelCount.leadingAnchor, constant: -24),
            progressView.heightAnchor.constraint(equalToConstant: 8)
        ])

        noWordsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noWordsCountLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 50),
            noWordsCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            noWordsCountLabel.trailingAnchor.constraint(equalTo: wordLabelCount.leadingAnchor, constant: -16),
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
