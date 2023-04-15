//
//  JsonLoader.swift
//  english-words
//
//  Created by user on 13.04.2023.
//

import Foundation

final class JsonLoader {

    static func loadProducts(filename: String) -> [Word]? {

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
