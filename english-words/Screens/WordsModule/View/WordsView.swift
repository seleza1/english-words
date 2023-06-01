//
//  WordsView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class WordsView: UIView {

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

    // MARK: - Public

    var didTapped: ((_ word: String, _ meaning: String) -> ())?

    var oneTapLearnButton: (() -> ())?

    let startLearnButton = UIButton()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()

        self.backgroundColor = .designSystemWhite
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(_ words: [Word]) {
        self.words = words.shuffled()
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
        let model = WordTableViewCellModel(word: word.word, isLearned: nil)

        cell.configure(model)
        cell.selectionStyle = .none

        return cell
    }
}

// MARK: - Extension

private extension WordsView {

    func setupViews() {
        addSubview(tableView)
        addSubview(startLearnButton)

        startLearnButton.setTitle(.startToLearnButtonTitle, for: .normal)
        startLearnButton.setTitleColor(UIColor.white, for: .normal)
        startLearnButton.titleLabel?.font = .startLearnButton
        startLearnButton.backgroundColor = .designSystemBlue
        startLearnButton.layer.cornerRadius = 33
        
        startLearnButton.addTarget(self, action: #selector(onTappStartLearnButton), for: .touchUpInside)
    }

    @objc func onTappStartLearnButton() {
        oneTapLearnButton?()
    }

    func setupConstraints() {

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
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
