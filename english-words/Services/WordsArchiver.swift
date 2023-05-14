//
//  WordsArchive.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import Foundation

enum ArchiverType: String {
    case all 
    case unknown
    case known
}

protocol WordsArchiverProtocol {
    func save(_ words: [Word])
    func retrieve() -> [Word]
}

final class WordsArchiver: WordsArchiverProtocol {

    // MARK: - Private Properties

    private let key: String

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    // MARK: - Initialization

    init(type: ArchiverType) {
        self.key = type.rawValue
    }
}

// MARK: - Extension

extension WordsArchiver {

    // MARK: - Public methods

    func save(_ words: [Word]) {

        do {
            let data = try encoder.encode(words)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func retrieve() -> [Word] {

        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }

        do {
            let array = try decoder.decode(Array<Word>.self, from: data)
            return array

        } catch {
            print(error)
        }
        return []
    }
}
