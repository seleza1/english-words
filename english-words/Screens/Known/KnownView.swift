//
//  KnownView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class KnownView: UIView {

    // MARK: - Private Properties

    private var words: [Word] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 104
        tableView.separatorStyle = .none

        return tableView
    }()

    let startLearnButton = Button(style: .repeatW)

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
        fetchWords()

        self.backgroundColor = .white
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
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as! TableViewCell

        let word = words[indexPath.item]
        let model = TableViewModel(word: word.word, isLearned: true)

        cell.configure(model)
        cell.selectionStyle = .none

        return cell
    }
}

// MARK: - Extension

private extension KnownView {

    // MARK: - Private Methods

    func setupViews() {
        self.addSubview(tableView)
        self.addSubview(startLearnButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            startLearnButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 38),
            startLearnButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            startLearnButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            startLearnButton.heightAnchor.constraint(equalToConstant: 40),

            tableView.topAnchor.constraint(equalTo: startLearnButton.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func fetchWords() {
        if let loadedWords = JsonLoader().loadProducts(.words5000) {
            words = loadedWords.shuffled()
        }
    }
}
