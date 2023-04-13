//
//  KnowWordsViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

class KnownWordsViewController: UIViewController {

    let wordsService = WordsService()

    var words: [Word] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(KnowCell.self, forCellReuseIdentifier: KnowCell.reuseId)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()

        words = wordsService.fetchWords()
    }
}

extension KnownWordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KnowCell.reuseId, for: indexPath) as! KnowCell

        let word = words[indexPath.row]
        cell.update(word)

        return cell
    }
}

extension KnownWordsViewController {

    private func setupViews() {
        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
}
