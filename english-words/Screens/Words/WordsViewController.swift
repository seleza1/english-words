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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()

        fetchWords()
    }

    private func fetchWords() {
        if let loadedWords = JsonLoader.loadProducts(filename: "words5000") {
            words = loadedWords.shuffled()
        }
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

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            words.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        } else if editingStyle == .insert {
//            print("fw")
//        }
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let knowWord = UIContextualAction(style: .normal, title: "Знаю") { (action, view, completionHandler) in
            self.words.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        knowWord.backgroundColor = #colorLiteral(red: 1, green: 0.229614228, blue: 0.1135809645, alpha: 1)

        let learnWord = UIContextualAction(style: .normal, title: "Изучаю") { (action, view, completionHandler) in
            tableView.insertRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        learnWord.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)

        let configuration = UISwipeActionsConfiguration(actions: [knowWord, learnWord])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
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
}

