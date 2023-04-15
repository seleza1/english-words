//
//  ViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class WordsViewController: UIViewController {

    let wordsService = WordsService()

    var words: [Word] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(WordCell.self, forCellReuseIdentifier: WordCell.reuseId)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupTableView()
        getWords()
    }
}

extension WordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordCell.reuseId, for: indexPath) as! WordCell
        cell.selectionStyle = .none

        let word = words[indexPath.item]
        cell.update(word)

        return cell
    }

}

extension WordsViewController {

    private func setupViews() {
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
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

    private func getWords() {
        if let loadedWords = JsonLoader.loadProducts(filename: "words5000") {
            words = loadedWords.shuffled()
        }
    }
}

