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

    var oneTapLearnButton: (() -> ())?

    let startLearnButton = UIButton()

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

        let word = words[indexPath.item]
        let model = TableViewModel(word: word.word, isLearned: nil)

        cell.configure(model)
        cell.selectionStyle = .none

        return cell
    }
}

// MARK: - Extension

private extension WordsView {

    func setupViews() {
        self.addSubview(tableView)
        self.addSubview(startLearnButton)

        startLearnButton.setTitle(.startToLearnButtonTitle, for: .normal)
        startLearnButton.setTitleColor(UIColor.white, for: .normal)
        startLearnButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        startLearnButton.backgroundColor = .designSystemBlue
        startLearnButton.layer.cornerRadius = 33

        startLearnButton.addTarget(self, action: #selector(tappedStartLearnButton), for: .touchUpInside)
    }

    @objc func tappedStartLearnButton() {
        oneTapLearnButton?()
    }

    func setupConstraints() {
        startLearnButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            startLearnButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            startLearnButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            startLearnButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            startLearnButton.heightAnchor.constraint(equalToConstant: 64),

            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

