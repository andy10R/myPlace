//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program
print("args: \(args)")
//var array: [String] = ["4", "x", "5", "%", "2"]
//var array: [String] = ["1", "+", "(", "2", "-", "3", ")", "x", "4", "+", "10", "/", "5"] //1 2 3 - 4 x + 10 5 / + -> -1

do {
    let RPNStack = try infixToRPN(expression: args)
    let result = calculateRPN(RPNStack: RPNStack)
//    print(array)
    print("RPN Expression: \(RPNStack)")
    print("result: \(result)")
} catch let error as Errors {
    print(error)
}


//var RPNStack = Stack<String>()
//RPNStack.push(item: "1")
//RPNStack.push(item: "2")
//RPNStack.push(item: "3")
//RPNStack.push(item: "x")
//RPNStack.push(item: "+")
//RPNStack.push(item: "4")
//RPNStack.push(item: "%")

//RPNStack.push(item: "4")
//RPNStack.push(item: "5")
//RPNStack.push(item: "x")
//RPNStack.push(item: "2")
//RPNStack.push(item: "%")






