//
//  ViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

class WordsViewModel {

    var onWordsChanged: (([Word])->())?

//    var words: [Word] = [] {
//        didSet {
//            onWordsChanged?(self.words)
//        }
//    }

    let jsonLoader = JsonLoader()
    let wordsArchiver = WordsArchiver()

    func fetchWords() {

        let archivedWords = wordsArchiver.retrieve()

        if archivedWords.isNotEmpty {
            //self.words = archivedWords
            onWordsChanged?(archivedWords)
            return
        }

        if let loadedWords = jsonLoader.loadProducts(filename: "words5000") {
            let words = loadedWords.shuffled()

            onWordsChanged?(words)
        }
    }
}

final class WordsVC: UIViewController {

    var viewModel = WordsViewModel()

    var wordsView: WordsView { return self.view as! WordsView }

    override func loadView() {
        self.view = WordsView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchWords()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.onWordsChanged = { [weak self] words in
            print("words", words)
            self?.wordsView.update(words)
            self?.wordsView.tableView.reloadData()
        }
    }

    private func fetchWords() {
        viewModel.fetchWords()
    }
}

