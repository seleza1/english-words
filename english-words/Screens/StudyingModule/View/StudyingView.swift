//
//  StudyingView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class StudyingView: UIView {

    // MARK: - Private

    private var words: [Word] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Public

    let continueToLearnButton = UIButton()

    var oneTapLearnButton: (() -> Void)?

    lazy var tableView: UITableView = {
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

        self.backgroundColor = .designSystemWhite
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(_ words: [Word]) {
        self.words = words
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

        continueToLearnButton.setTitle(.continueToLearnButtonTitle, for: .normal)
        continueToLearnButton.setTitleColor(.designSystemWhite, for: .normal)
        continueToLearnButton.titleLabel?.font = .wordLabelMin
        continueToLearnButton.backgroundColor = .designSystemBlue
        continueToLearnButton.layer.cornerRadius = 33

        continueToLearnButton.addTarget(self, action: #selector(onActionsLearnButton), for: .touchUpInside)
    }

    @objc func onActionsLearnButton() {
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
        
        continueToLearnButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continueToLearnButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            continueToLearnButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            continueToLearnButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            continueToLearnButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
