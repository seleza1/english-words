//
//  WordsArchive.swift
//  english-words
//
//  Created by user on 26.04.2023.
//

import Foundation

//All words
//Known
//Unknown


enum ArchiverType: String {
    case all 
    case unknown
    case known
}

protocol WordsArchiverProtocol {
    func save(_ words: [Word]) //сохраняем слова
    func retrieve() -> [Word] //закладываем их массивом
}

final class WordsArchiver: WordsArchiverProtocol {

    private let encoder = JSONEncoder() //кодирует в бинарник
    private let decoder = JSONDecoder() //разкодирует

    init(type: ArchiverType) {
        self.key = type.rawValue
    }
    private let key: String

    //MARK: - Public methods
    func save(_ words: [Word]) { //метод сохранить

        //Array<Product> -> Data
        //массив кладем в бинарник и кодируем, бинарник кладем в UserDefaults
        do {
            let data = try encoder.encode(words)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    //retrieve - получить данные
    func retrieve() -> [Word] {  //метод получить

        //Data -> Array<Product>
        //вытаскиваем из UserDefaults бинарник
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            //раскодировали бинарник в массив
            let array = try decoder.decode(Array<Word>.self, from: data)
            return array

        } catch {
            print(error)
        }
        return []
    }
}