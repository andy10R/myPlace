//
//  Expression.swift
//  calc
//
//  Created by Zhongtao  Chen on 29/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

//func checkExpression(expression: [String]) throws -> Bool {
//    for item in expression {
//
//    }
//    return true
//}

func evaluateOperator(lastOperator: Operators, thisOperator: Operators) -> Bool {
    let lastOperatorPrecedence = operatorPrecedence(oper: lastOperator)
    let thisOperatorPrecedence = operatorPrecedence(oper: thisOperator)
    
    if lastOperatorPrecedence >= thisOperatorPrecedence {
        return true
    }
    return false
}

func infixToRPN(expression: [String]) throws -> Stack<String> {
    var RPNStack = Stack<String>()
    var operatorStack = Stack<String>()
    
    for item in expression {
        if nil != Int(item) {
            RPNStack.push(item: item)
        } else {
            if let oper = operatorDic[item] {
                switch oper {
                    case .leftBracket:
                        operatorStack.push(item: item)
                    
                    case .rightBracket:
                        while let lastOperator = operatorStack.pop() {
                            if operatorDic[lastOperator] != Operators.leftBracket {
                                RPNStack.push(item: lastOperator)
                            } else {
                                break
                            }
                        }
                    
                    default:
                        while let lastOperator = operatorStack.pop() {
                            if evaluateOperator(lastOperator: operatorDic[lastOperator]!, thisOperator: oper) {
                                RPNStack.push(item: lastOperator)       //!!!!!!!!!error???!!!
                            } else {
                                // if this is greater than last, push the last back into the operatorStack
                                operatorStack.push(item: lastOperator)
                                break
                            }
                        }
                        operatorStack.push(item: item)
                }
            } else {
                throw Errors.invalidInput(item)
                //exit(2)         //ERROR !!!!!!! undefined operator
            }
        }
    }
    while let remainingOperator = operatorStack.pop() {
        RPNStack.push(item: remainingOperator)
    }
//    print("operatorstack: \(operatorStack)")
    
    return RPNStack
}
