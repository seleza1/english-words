//
//  KnownView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

final class KnownView: UIView {

    var words: [Word] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    let startLearnButton = Button(style: .repeatW)

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(KnowCell.self, forCellReuseIdentifier: KnowCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        
        return tableView
    }()

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

    func update(_ words: [Word]) {
        self.words = words
    }
}

extension KnownView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KnowCell.reuseId, for: indexPath) as! KnowCell
        cell.selectionStyle = .none

        let word = words[indexPath.item]
        cell.update(word)

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        createHeaderSectionLabel(index: words.count)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let knowWord = UIContextualAction(style: .normal, title: Resources.Title.tableViewKnownButtonTitle) { (action, view, completionHandler) in
            self.words.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        knowWord.backgroundColor = Resources.Colors.wordKnownButton

        let learnWord = UIContextualAction(style: .normal, title: Resources.Title.tableViewLearnButtonTitle) { (action, view, completionHandler) in
            tableView.insertRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        learnWord.backgroundColor = Resources.Colors.justGreen

        let configuration = UISwipeActionsConfiguration(actions: [knowWord, learnWord])
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
    }
}

extension KnownView {

    private func setupViews() {
        self.addSubview(tableView)
        self.addSubview(startLearnButton)
    }

    private func setupConstraints() {
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

    private func fetchWords() {
        if let loadedWords = JsonLoader().loadProducts(.words5000) {
            words = loadedWords.shuffled()
        }
    }

    private func createHeaderSectionLabel(index: Int = 0) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = Resources.Colors.justGreen
        label.heightAnchor.constraint (equalToConstant: 50).isActive = true
        label.text = "\(Resources.Title.allLearnHeader) - \(index)"

        return label

    }
}