//
//  main.swift
//  crypto_Ue1
//
//  Created by Trautmann, Phillip and Wendt, Ole on 20.10.16.
//  Copyright © 2016 Trautmann, Phillip and Wendt, Ole. All rights reserved.
//
import AVFoundation
import Foundation

var shortbeep:AVAudioPlayer!
var longBeep:AVAudioPlayer!

var audioFilePath = Bundle.main.path(forResource: "music", ofType: "wav")
let url1 = URL(fileURLWithPath: "/Volumes/ptrautma$/Arbeit/Xcode_Projects/crypto_Ue1/shortBeep.wav")
let url2 = URL(fileURLWithPath: "/Volumes/ptrautma$/Arbeit/Xcode_Projects/crypto_Ue1/longBeep.wav")

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
                                           " ":" ",
                                           "Ä":".-.-",
                                           "Ü":"..--",
                                           "Ö":"---.",
                                           "ß":"...--.."]

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
                                       " ":" ",
                                       ".-.-":"Ä",
                                       "..--":"Ü",
                                       "---.":"Ö",
                                       "...--..":"ß"]


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
        let morseSequenz = translateToMorse(symbol:inputString[index])

        for i in morseSequenz.characters.indices{
        if morseSequenz[i] == "."{
            playShortBeep()
        }
        if morseSequenz[i] == "-"{
            playLongBeep()
        }
        }
        usleep(100000)
    }
    return resultString
}

func translateMorseCodeToLetters(_ inputString: String) -> String {
    var resultString = ""
    let words = inputString.components(separatedBy: "  ")
    for currentWord in words {
        let componentsOfFirstWord = currentWord.components(separatedBy: " ")
        for currentLetter in componentsOfFirstWord {
            if currentLetter.characters.count > 0 {
                resultString.append(translateOneLetter(symbol:currentLetter))
            }
        }
        resultString.append(" ")
    }
    return resultString
}

func encodeMesageToMorseCode () -> String {
    print("plaintext please")
    let inputFromCommandLine = getInputStringFromCommandLine()
    let encodedMessage = translateLettersToMorseCode(inputFromCommandLine)
    return encodedMessage
}

func decodeSecretMessage () -> String{
    print("cyphretext please")
    let inputFromCommandLine = getInputStringFromCommandLine()
    let decodeMessage = translateMorseCodeToLetters(inputFromCommandLine)
    return decodeMessage
}

func main() {
    var close = false;
    while (!close) {
        print("Your Options: 'encrypt', 'decrypt' or 'exit'")
        let inputFromCommandLine = getInputStringFromCommandLine()
    if(inputFromCommandLine == "ENCRYPT"){
        print(encodeMesageToMorseCode())
    } else if (inputFromCommandLine == "DECRYPT") {
            print(decodeSecretMessage())
    } else if (inputFromCommandLine == "EXIT") {
        close = true;
        }
    }
}

func playShortBeep(){
    do {
        let sound = try AVAudioPlayer(contentsOf: url1)
        shortbeep = sound
        sound.play()
        usleep(200000)
    } catch {
        print("file not found")
    }
}

func playLongBeep(){
    do {
        let sound = try AVAudioPlayer(contentsOf: url2)
        longBeep = sound
        sound.play()
        usleep(200000)
    } catch {
        print("file not found")
    }
}
main()

