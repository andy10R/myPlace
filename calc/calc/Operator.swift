//
//  Operator.swift
//  calc
//
//  Created by Zhongtao  Chen on 29/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

enum Operators: String {
    case plus = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
    case modul = "%"
    case leftBracket = "("
    case rightBracket = ")"
}

func operatorPrecedence (oper: Operators) -> Int {
    switch oper {
        case .leftBracket:
            return 0
        case .plus, .subtraction:
            return 1
        case .multiplication, .division, .modul:
            return 2
        case .rightBracket:
            return 4
    }
    
}

var operatorDic: [String: Operators] = [
    "+": .plus,
    "-": .subtraction,
    "x": .multiplication,
    "/": .division,
    "%": .modul,
    "(": .leftBracket,
    ")": .rightBracket ]

//func evaluateOperator(oper: String) -> Operators {
//    switch oper {
//    case "+":
//        return .plus
//    case "-":
//        return .subtraction
//    case "*":
//        return .multiplication
//    case "/":
//        return .division
//    case "%":
//        return .modul
//    case "(":
//        return .leftBracket
//    case ")":
//        return .rightBracket
//    default:
//        return      // ERROR!!!!!!!!!!
//    }
//}

