//
//  WordsView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class WordsView: UIView {

    // MARK: - Private Properties

    private var words: [Word] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Public Properties

    var didTapped: ((_ word: String, _ meaning: String) -> ())?

    let startLearnButton = Button(style: .start)

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

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()

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

extension WordsView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as! TableViewCell
        cell.selectionStyle = .none

        let word = words[indexPath.item]
        
        let model = TableViewModel(word: word.word, isLearned: nil)

        cell.configure(model)

        return cell
    }
}

// MARK: - Extension

private extension WordsView {

    func setupViews() {
        self.addSubview(tableView)
        self.addSubview(startLearnButton)

    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            startLearnButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            startLearnButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            startLearnButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -102),
            startLearnButton.heightAnchor.constraint(equalToConstant: 64),

            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

