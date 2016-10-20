//
//  main.swift
//  crypto_Ue1
//
//  Created by Trautmann, Phillip on 20.10.16.
//  Copyright © 2016 Trautmann, Phillip. All rights reserved.
//

import Foundation
//Zwischen Buchstaben eine Leerstelle zwischen Wörtern zwei
var morseCodeTable: [String: String] = ["A":".-",
                                       "B":"-...",
                                       "C":"-.-.",
                                       "D":"-..",
                                       "E":".",
                                       "F":"..-.",
                                       "G":"--.",
                                       "H":"....",
                                       "I":"..",
                                       "J":".---",
                                       "K":"-.-",
                                       "L":".-..",
                                       "M":"--",
                                       "N":"-.",
                                       "O":"---",
                                       "P":".--.",
                                       "Q":"--.-",
                                       "R":".-.",
                                       "S":"...",
                                       "T":"-",
                                       "U":"..-",
                                       "V":"...-",
                                       "W":".--",
                                       "X":"-..-",
                                       "Y":"-.--",
                                       "Z":"--..",
                                       "1":".----",
                                       "2":"..---",
                                       "3":"...--",
                                       "4":"....-",
                                       "5":".....",
                                       "6":"-....",
                                       "7":"--...",
                                       "8":"---..",
                                       "9":"----.",
                                       "0":"-----"]


func getInputStringFromCommandLine() -> String {
    let uncheckedInputString = readLine()
    let checkedInputString = uncheckedInputString ?? ""
    if checkedInputString == "" {
        print("there is no input from the command line")
    }
    return checkedInputString
}

func encodeMesageToMorseCode() -> String {
    return("ToDo")
}

func translateToMorse(symbol: String) -> String{
    if let symbol = morseCodeTable[symbol]{
        return symbol
    }
    return "???"
}

print(translateToMorse(symbol: "."))
