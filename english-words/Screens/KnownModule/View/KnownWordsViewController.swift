//
//  KnowWordsViewController.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class KnownWordsViewController: UIViewController {

    // MARK: - Private

    private var knowView: KnownView {
        return self.view as! KnownView
    }

    private let viewModel: KnownWordsViewModel

    init(viewModel: KnownWordsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func loadView() {
        self.view = KnownView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
        updatesMeaning()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.viewDidAppear()
    }

    func update(with word: [Word]) {
        knowView.configure(word)
    }

    func updatesMeaning() {
        knowView.wordMeaning = { [weak self] word, translate in
            let wordMeaning = WordMeaningModuleAssembly.buildModule()

            guard let wordMeaningView = wordMeaning.view as? WordMeaningView else { return }
            wordMeaningView.configureScreen(word: word.capitalized, translate: translate.capitalized)

            wordMeaning.modalPresentationStyle = .fullScreen
            self?.navigationController?.pushViewController(wordMeaning, animated: true)
        }
    }
}
