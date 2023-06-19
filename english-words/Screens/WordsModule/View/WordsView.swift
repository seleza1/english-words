//
//  WordsView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class WordsView: UIView {

    // MARK: - Private

    private let progressView = UIProgressView()
    private let wordLabelCount = UILabel()
    private let startLearnButton = UIButton()

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

    var didTapped: ((_ word: String, _ meaning: String) -> Void)?

    var oneTapLearnButton: (() -> Void)?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
        setupActions()

        backgroundColor = .designSystemWhite
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(_ words: [Word]) {
        self.words = words

        let wordStatusLearningAndNone = words.filter { word in
            if word.status == .learning || word.status == .none {
                return true
            } else {
                return false
            }
        }

        let wordStatusLearned = words.filter { word in
            if word.status == .learned {
                return true
            } else {
                return false
            }
        }

        wordLabelCount.text = "\(wordStatusLearningAndNone.count) слов"

        let progress = Float(wordStatusLearned.count) / Float(wordStatusLearningAndNone.count)
        progressView.progress = progress
    }
}

// MARK: - Extension Table View Data Source, UITableViewDelegate

extension WordsView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordTableViewCell.reuseId, for: indexPath) as! WordTableViewCell

        let word = words[indexPath.item]

        var isLearned: Bool?

        if let status = word.status {
            isLearned = status == .learned
        }

        let model = WordTableViewCellModel(word: word.word, isLearned: isLearned)

        cell.configure(model)
        cell.selectionStyle = .none

        return cell
    }
}

// MARK: - Private Methods

private extension WordsView {

    func setupViews() {
        addSubview(tableView)
        addSubview(startLearnButton)
        addSubview(progressView)
        addSubview(wordLabelCount)

        startLearnButton.setTitle(.startToLearnButtonTitle, for: .normal)
        startLearnButton.setTitleColor(UIColor.white, for: .normal)
        startLearnButton.titleLabel?.font = .startLearnButton
        startLearnButton.backgroundColor = .designSystemBlue
        startLearnButton.layer.cornerRadius = 33

        progressView.progressTintColor = .designSystemGreen
        progressView.trackTintColor = .designSystemBlue
        progressView.layer.cornerRadius = 12
    }

    @objc func onTappStartLearnButton() {
        oneTapLearnButton?()
    }

    func setupActions() {
        startLearnButton.addTarget(self, action: #selector(onTappStartLearnButton), for: .touchUpInside)
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

        startLearnButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startLearnButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            startLearnButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            startLearnButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            startLearnButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
