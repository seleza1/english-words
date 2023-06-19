//
//  JSONLoader.swift
//  english-words
//
//  Created by user on 13.04.2023.
//

import Foundation

enum JSONFile: String {
    
    case words5000
}

final class JSONLoader {

    func loadWords(_ file: JSONFile) -> [Word]? {
        let filename = file.rawValue
        
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)

                let jsonData = try JSONDecoder().decode([Word].self, from: data).shuffled()

                return jsonData
            } catch {
                print("JSONLoader error: \(error)")
            }
        }
        return nil
    }
}
