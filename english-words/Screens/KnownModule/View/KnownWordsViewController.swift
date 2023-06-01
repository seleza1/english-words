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

    private let viewModel: KnowWordsViewModel

    init(viewModel: KnowWordsViewModel) {
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
    }

    func update(with word: [Word]) {
        knowView.configure(word)
    }
}
