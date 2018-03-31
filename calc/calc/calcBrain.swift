//
//  calcBrain.swift
//  calc
//
//  Created by Zhongtao  Chen on 29/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation


func plus(operand1: Int, plus operand2: Int) -> Int {
    return operand1 + operand2
}

func subtraction(operand1: Int, subtract operand2: Int) -> Int {
    return operand1 - operand2
}

func multiplication(operand1: Int, times operand2: Int) -> Int {
    return operand1 * operand2
}

func division(operand1: Int, dividedBy operand2: Int) throws -> Int {
    if 0 == operand2 {
        throw Errors.dividedBy0         // divided by 0, throw error
    }
    return operand1 / operand2
}

func moduel(operand1: Int, moduelBy operand2: Int) -> Int {
    return operand1 % operand2
}

// calculate a RPN expression
func calculateRPN(RPNStack: Stack<String>) -> Int {
    let RPNArray = RPNStack.toArray()
    var resultStack = Stack<Int>()
    var operand1: Int
    var operand2: Int
    var result: Int
    
    for item in RPNArray {
        if let element = Int(item) {
            resultStack.push(item: element)
        } else {
            if let oper = operatorDic[item] {
                operand2 = resultStack.pop()!
                operand1 = resultStack.pop()!
                switch oper {
                    case .plus:
                        result = plus(operand1: operand1, plus: operand2)
                        resultStack.push(item: result)
                    case .subtraction:
                        result = subtraction(operand1: operand1, subtract: operand2)
                        resultStack.push(item: result)
                    case .multiplication:
                        result = multiplication(operand1: operand1, times: operand2)
                        resultStack.push(item: result)
                    case .division:
                        // catch divided by 0 error
                        do {
                            try result = division(operand1: operand1, dividedBy: operand2)
                            resultStack.push(item: result)
                        } catch let error as Errors {
                            print(error)
                        } catch {
                            print("Errors")
                        }
                    
                    case .modul:
                        result = moduel(operand1: operand1, moduelBy: operand2)
                        resultStack.push(item: result)
                    case .leftBracket:
                        break
                    case .rightBracket:
                        break
                }
            }
        }
    }
    
    result = resultStack.pop()!
    return result
}


