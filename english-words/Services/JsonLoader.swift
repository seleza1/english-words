//
//  JsonLoader.swift
//  english-words
//
//  Created by user on 13.04.2023.
//

import Foundation

enum LoaderType: String {
    case words5000
}

final class JsonLoader {

    // MARK: - Public Methods

    func loadProducts(_ type: LoaderType) -> [Word]? {

        let filename = type.rawValue
        print(filename)

        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)

                let jsonData = try JSONDecoder().decode([Word].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
