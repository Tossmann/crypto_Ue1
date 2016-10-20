//
//  main.swift
//  crypto_Ue1
//
//  Created by Trautmann, Phillip on 20.10.16.
//  Copyright © 2016 Trautmann, Phillip. All rights reserved.
//

import Foundation

func getInputStringFromCommandLine() -> String {
    let uncheckedInputString = readLine()
    let checkedInputString = uncheckedInputString ?? ""
    if checkedInputString == "" {
        print("there is no input from the command line")
    }
    return checkedInputString
}

func encodeMesageToMorseCode(_ string : String) -> String {
    return("ToDo")
}

print(getInputStringFromCommandLine())
