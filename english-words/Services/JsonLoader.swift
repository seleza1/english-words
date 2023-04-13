//
//  JsonLoader.swift
//  english-words
//
//  Created by user on 13.04.2023.
//

import Foundation

final class JsonLoader {

    func loadProducts(filename: String) -> [Word]? {

        if let url = Bundle.main.url(forResource: "words5000", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)//выгружаем контент из файла JSON по пути url в некую бинарный тип данных

                let jsonData = try JSONDecoder().decode([Word].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
