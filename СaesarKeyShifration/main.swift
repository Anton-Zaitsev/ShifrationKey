//
//  main.swift
//  СaesarKeyShifration
//
//  Created by Антон Зайцев on 07.09.2021.
//

import Foundation

public let symvolsDelete : [String] =  [" ", "1","2","3","4","5","6","7","8","9","0", "_", ",", ".", "?", "/", "-", "(", ")", "!", "#", ":", ";", "*", "\"", "\"", "\n", "ò","«", "»" ]

let shag  = 5 ;
let shifr : String = ChezarShifr.toShifration(key: "ThisMyshifr", shag: 10, value: "Привет мир, как у вас дела?")
print("Итоговой шифр:  \(shifr)")
PopularCharacted.AnalizText()

