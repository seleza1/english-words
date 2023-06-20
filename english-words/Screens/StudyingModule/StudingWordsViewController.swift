//
//  noKnowWordViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

class StudingWordsViewController: UIViewController {

    let wordsService = WordsService()

    var words: [Word] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NoKnowCell.self, forCellReuseIdentifier: NoKnowCell.reuseId)
        return tableView
    }()

    private let startLearnButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать обучение", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.992441237, green: 0.8533335924, blue: 0.4606403112, alpha: 1)
        button.layer.cornerRadius = 11
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()

        words = wordsService.fetchWords()
    }
}

extension StudingWordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoKnowCell.reuseId, for: indexPath) as! NoKnowCell

        let word = words[indexPath.row]
        cell.update(word)

        return cell
    }
}

extension StudingWordsViewController {

    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(startLearnButton)
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
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
}
