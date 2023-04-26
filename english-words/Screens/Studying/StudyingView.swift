//
//  StudyingView.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import UIKit

/*

 Responsibilities

 1. Configure UI
 2. View Hierarchy
 3. Layout UI
 4. Delegate/Datasource UI

*/

final class StudyingView: UIView {

    //var onAddCardAction: (() -> Void)?

    var words: [Word] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StudyingCell.self, forCellReuseIdentifier: StudyingCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        return tableView
    }()

    let startLearnButton = Button(style: .start)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()

        self.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(_ words: [Word]) {
        self.words = words
    }
}

extension StudyingView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudyingCell.reuseId, for: indexPath) as! StudyingCell
        cell.selectionStyle = .none

        let word = words[indexPath.item]
        cell.update(word)

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        createHeaderSectionLabel(index: words.count-4)
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
        learnWord.backgroundColor = Resources.Colors.wordLearnButton

        let configuration = UISwipeActionsConfiguration(actions: [knowWord, learnWord])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}

extension StudyingView {

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

    private func createHeaderSectionLabel(index: Int = 0) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        label.heightAnchor.constraint (equalToConstant: 50).isActive = true
        //label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Слов на изучение - \(index)"
        return label

    }
}
