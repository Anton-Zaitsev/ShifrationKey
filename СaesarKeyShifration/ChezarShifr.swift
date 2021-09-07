//
//  ChezarShifr.swift
//  СaesarKeyShifration
//
//  Created by Антон Зайцев on 07.09.2021.
//

import Foundation

public class ChezarShifr
{
   public static let alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ";
    
    public static func toShifration(key: String, shag: Int, value: String) -> String{
        
        print("Ваш шаг: \(shag)")
        print("Ваше слово: \(value)")
        print("Ваш ключ: \(key)")
        
        let oldcharactersAlphavit : Array<Character> = Array(alph)
        let charactersKey : Array<Character> = Array(key)
        var itogShift : String  = key
        var charactersAlphavit : String = ""
        
        let myValue = value.uppercased();
        
        for i in myValue { // Конвертируем слово в шифр из алгоритма
                var index: Int = 0
                if let range: Range<String.Index> = alph.range(of: "\(i)") {
                    index = alph.distance(from: alph.startIndex, to: range.lowerBound)
                    // Находим индекс в алфавите
                    let newIndex = index + shag
                    charactersAlphavit += "\(oldcharactersAlphavit[newIndex])"
                }
            }
        
        var oldCharaced = Array(charactersAlphavit)
        
        for i in charactersKey {
            if alph.contains(i) { // ВОТ ТУТ ПРОИСХОДИТ ПРОВЕРКА НАЛИЧИЯ СИМВОЛА В СТРОКЕ
               //Символ присутствует
                var index = 0;
                if let range: Range<String.Index> = charactersAlphavit.range(of: "\(i)") {
                    index = charactersAlphavit.distance(from: charactersAlphavit.startIndex, to: range.lowerBound) // Находим индекс в алфавите
                    oldCharaced.remove(at: index)
                }
            }
        }
        for _ in 0..<shag {
            let lastElement = oldCharaced.last
            itogShift = "\(lastElement!)" + itogShift
            oldCharaced.removeLast()
        }
       return itogShift + String(charactersAlphavit)
        
    }
}
