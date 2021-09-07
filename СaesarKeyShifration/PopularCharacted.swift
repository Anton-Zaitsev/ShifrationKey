//
//  PopularCharacted.swift
//  СaesarKeyShifration
//
//  Created by Антон Зайцев on 07.09.2021.
//

import Foundation
import Cocoa

public struct Statistic {
    var count : Int
    var symbols : String
    var chastota : Double
}

public class PopularCharacted
{

    private static var ArrayWarAndPeace : [String] = [String]()
    private static var count : Int = 1
    private static var StatisticSymbolsFromText : [Statistic] = [Statistic]()
    public static func AnalizText ()
    {
        let fileURLProject = "/Users/anton/Desktop/СaesarKeyShifration/СaesarKeyShifration/WarAndPeace.txt";
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject, encoding: String.Encoding.utf8)
        } catch let error as NSError {
             print("Ошибка чтения файла, Ошибка: " + error.localizedDescription)
        }
        ArrayWarAndPeace = readStringProject.split(separator: "\n").map({ (substring) in
            return String(substring)
        })
        
        for item in Array(ChezarShifr.alph) {
            StatisticSymbolsFromText.append(Statistic(count: 0, symbols: "\(item)", chastota: 0))
        }
        
       /*
        for abzac in ArrayWarAndPeace { //Получаем Абзадцы из текста
           
            print("\n Абзац \(count) статистика:")
            let result = DeleteSybols(stroka: abzac)
            Analization(resultNoCorrected: result)
            count += 1
            
        }
         */
        print("\n Cтатистика по всему тексту:")
        let shifr = ChezarShifr.toShifration(key: "MYkeyTOwarAndPeace", shag: 10, value: readStringProject)
        print("Шифрованный текст: \(shifr)")
        let result = DeleteSybols(stroka: shifr )
        Analization(resultNoCorrected: result)
        
        
    }
    
     private static func  DeleteSybols (stroka : String) -> String {
        var NewStroka : String = stroka
        
        for deleteSymvols in symvolsDelete {
        let result = NewStroka.replacingOccurrences(of: deleteSymvols, with: "",
                                                  options: NSString.CompareOptions.literal, range:nil)
            NewStroka = result
        }
        return NewStroka
    }
    
    private static func Analization (resultNoCorrected : String) {
         
        let alp = ChezarShifr.alph.uppercased()
        let result = resultNoCorrected.uppercased()
        let count = result.count
        for char in Array(result) {
            
            if alp.contains(char) { // Есть ли этот символ в алфавите
            if let range: Range<String.Index> = alp.range(of: "\(char)") {
               let index = alp.distance(from: alp.startIndex, to: range.lowerBound)
                // Находим индекс в алфавите
                StatisticSymbolsFromText[index].count += 1; // То добавляем найденый в массиве +1
            }
            }
        }
        
        for index in 0..<StatisticSymbolsFromText.count {
            if (StatisticSymbolsFromText[index].count != 0){
                StatisticSymbolsFromText[index].chastota = Double((StatisticSymbolsFromText[index].count * 100) / count)
            }
        }
        
        StatisticSymbolsFromText.sort(by: { $0.chastota > $1.chastota }) // Соритровка массива
        
        print("Топ 10 самых часто встречающих букв в тексте")
        for index in 0..<10 {
            print("Буква ", StatisticSymbolsFromText[index].symbols, " встречается в тексте: " ,
                  String(format: "%.2f", StatisticSymbolsFromText[index].chastota), " % с количеством в ", StatisticSymbolsFromText[index].count, "раз" )
        }
        
    }
}
