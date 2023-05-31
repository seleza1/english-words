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

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WordTableViewCell.self, forCellReuseIdentifier: WordTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 104
        tableView.separatorStyle = .none

        return tableView
    }()

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

    func update(_ words: [Word]) {
        self.words = words
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
}

// MARK: - Extension

private extension KnownView {

    func setupViews() {
        addSubview(tableView)
    }

    func setupConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
