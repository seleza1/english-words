//
//  KnownView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class KnownView: UIView {

    // MARK: - Private

    private var words: [Word] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private let progressView = UIProgressView()
    private let wordLabelCount = UILabel()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WordTableViewCell.self, forCellReuseIdentifier: WordTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 104
        tableView.separatorStyle = .none

        return tableView
    }()

    var wordMeaning: ((_ word: String,_ translate: String) -> Void)?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()

        backgroundColor = .designSystemWhite
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(_ words: [Word]) {
        self.words = words
        
        let progress = Float(words.count) / Float(5000)
        progressView.progress = progress
        wordLabelCount.text = "\(words.count) слов"

    }
}

// MARK: - Extension Table View Data Source, UITableViewDelegate

extension KnownView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordTableViewCell.reuseId, for: indexPath) as! WordTableViewCell

        let word = words[indexPath.item]
        let model = WordTableViewCellModel(word: word.word, isLearned: true)

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

        progressView.progressTintColor = .designSystemGreen
        progressView.layer.cornerRadius = 12
        progressView.trackTintColor = .designSystemWhite
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
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
