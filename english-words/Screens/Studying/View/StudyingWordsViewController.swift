//
//  StudyingViewController.swift
//  english-words
//
//  Created by user on 13.04.2023.
//

import UIKit

final class StudyingWordsViewController: UIViewController {

    // MARK: - Private

    private var viewModel = StudyingWordsModel()

    private var studyingView: StudyingView {
        return self.view as! StudyingView
    }

    init(viewModel: StudyingWordsModel) {
        super.init(nibName: "", bundle: nil)
        self.viewModel = viewModel
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func loadView() {
        self.view = StudyingView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchWords()
        startLearnButtonTapped()
        viewModel.viewDidLoad()
    }
}

// MARK: - Extension

private extension StudyingWordsViewController {

    func startLearnButtonTapped() {
        studyingView.oneTapLearnButton = {
            let controller = GameAssembler.buildModule()
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true)
        }
    }

    func fetchWords() {
        viewModel.fetchWords()
    }
}
