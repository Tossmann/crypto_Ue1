//
//  main.swift
//  crypto_Ue1
//
//  Created by Trautmann, Phillip on 20.10.16.
//  Copyright © 2016 Trautmann, Phillip. All rights reserved.
//

import Foundation
//Zwischen Buchstaben eine Leerstelle zwischen Wörtern zwei

var morseCodeTable: [Character: String] = ["A":".-",
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
                                           "0":"-----",
                                           " ":" "]

var morseCodeTableReverse: [String: Character] = [".-":"A",
                                       "-...":"B",
                                       "-.-.":"C",
                                       "-..":"D",
                                       ".":"E",
                                       "..-.":"F",
                                       "--.":"G",
                                       "....":"H",
                                       "..":"I",
                                       ".---":"J",
                                       "-.-":"K",
                                       ".-..":"L",
                                       "--":"M",
                                       "-.":"N",
                                       "---":"O",
                                       ".--.":"P",
                                       "--.-":"Q",
                                       ".-.":"R",
                                       "...":"S",
                                       "-":"T",
                                       "..-":"U",
                                       "...-":"V",
                                       ".--":"W",
                                       "-..-":"X",
                                       "-.--":"Y",
                                       "--..":"Z",
                                       ".----":"1",
                                       "..---":"2",
                                       "...--":"3",
                                       "....-":"4",
                                       ".....":"5",
                                       "-....":"6",
                                       "--...":"7",
                                       "---..":"8",
                                       "----.":"9",
                                       "-----":"0",
                                       " ":" "]




func getInputStringFromCommandLine() -> String {
    let uncheckedInputString = readLine()
    let checkedInputString = uncheckedInputString ?? ""
    if checkedInputString == "" {
        print("there is no input from the command line")
    }
    return checkedInputString.uppercased()
}

func translateToMorse(symbol: Character) -> String{
    if let symbol = morseCodeTable[symbol]{
        return symbol
    }
    return "???"
}

func translateOneLetter(symbol: String) -> Character {
    if let symbol = morseCodeTableReverse[symbol]{
        return symbol
    }
    return "?"
}

func translateLettersToMorseCode(_ inputString: String) -> String {
    var resultString = ""
    for index in inputString.characters.indices {
        resultString.append("\(translateToMorse(symbol:inputString[index])) ")
    }
    return resultString
}

func translateMorseCodeToLetters(_ inputString: String) -> String {
    var resultString = ""
    var words = inputString.components(separatedBy: "  ")
    for currentWord in words {
        var componentsOfFirstWord = currentWord.components(separatedBy: " ")
        for currentLetter in componentsOfFirstWord {
            resultString.append(translateOneLetter(symbol:currentLetter))
        }
        resultString.append(" ")
    }
    return resultString
}

func encodeMesageToMorseCode () -> String {
    let inputFromCommandLine = getInputStringFromCommandLine()
    let encodedMessage = translateLettersToMorseCode(inputFromCommandLine)
    return encodedMessage
}

func decodeSecretMessage () -> String{
    let inputFromCommandLine = getInputStringFromCommandLine()
    let decodeMessage = translateMorseCodeToLetters(inputFromCommandLine)
    return decodeMessage
}

//print(encodeMesageToMorseCode())
print(decodeSecretMessage())
