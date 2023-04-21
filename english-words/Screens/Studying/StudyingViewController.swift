//
//  StudyingViewController.swift
//  english-words
//
//  Created by user on 13.04.2023.
//

import UIKit

final class StudyingWordsViewController: UIViewController {

    let wordsService = WordsService()

    var words: [Word] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StudyingCell.self, forCellReuseIdentifier: StudyingCell.reuseId)
        return tableView
    }()

    private let startLearnButton = Button(style: .start)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupTableView()

        startLearnButton.onAction = {
            let gameVC = GameViewController()
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: true)
        }

        words = wordsService.fetchWords()
    }
}

extension StudyingWordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudyingCell.reuseId, for: indexPath) as! StudyingCell

        let word = words[indexPath.row]
        cell.update(word)

        return cell
    }
}

extension StudyingWordsViewController {

    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(startLearnButton)
        view.backgroundColor = .white
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            startLearnButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 38),
            startLearnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            startLearnButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            startLearnButton.heightAnchor.constraint(equalToConstant: 40),

            tableView.topAnchor.constraint(equalTo: startLearnButton.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
    }
}
