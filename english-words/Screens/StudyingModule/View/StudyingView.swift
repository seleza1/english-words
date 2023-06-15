//
//  StudyingView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class StudyingView: UIView {

    // MARK: - Private

    private let progressView = UIProgressView()
    private let wordLabelCount = UILabel()
    private let continueToLearnButton = UIButton()

    lazy var tableView: UITableView = {
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
        
        let progress = Float(words.count) / Float(5000)
        progressView.progress = progress
        wordLabelCount.text = "\(words.count) слов"
    }
}

// MARK: - Extension Table View Data Source, UITableViewDelegate

extension StudyingView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordTableViewCell.reuseId, for: indexPath) as! WordTableViewCell

        let word = words[indexPath.item]
        let model = WordTableViewCellModel(word: word.word, isLearned: false)

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
        addSubview(wordLabelCount)

        continueToLearnButton.setTitle(.continueToLearnButtonTitle, for: .normal)
        continueToLearnButton.setTitleColor(.designSystemWhite, for: .normal)
        continueToLearnButton.titleLabel?.font = .wordLabelMin
        continueToLearnButton.backgroundColor = .designSystemBlue
        continueToLearnButton.layer.cornerRadius = 33
        continueToLearnButton.addTarget(self, action: #selector(onActionsLearnButton), for: .touchUpInside)

        progressView.progressTintColor = .designSystemOrange
        progressView.layer.cornerRadius = 12
        progressView.trackTintColor = .designSystemWhite

        backgroundColor = .designSystemWhite

    }

    @objc func onActionsLearnButton() {
        oneTapLearnButton?()
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
        
        continueToLearnButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continueToLearnButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            continueToLearnButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            continueToLearnButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            continueToLearnButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
