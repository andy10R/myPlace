//
//  Error.swift
//  calc
//
//  Created by Zhongtao  Chen on 29/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

enum Errors: Error, CustomStringConvertible {
    case dividedBy0     // divided by 0
//    case invalidOperator (Operators)        // undefined operator
    case invalidExpression      // mistake in the expression
    case invalidInput (String)      // undefined operator,  not number or operator
    
    var description: String {
        switch self {
        case .dividedBy0:
            return "Errors: Divided by 0. Please check expression."
        case .invalidExpression:
            return "Errors: Expression cannot be calucated. Please input again."
        case .invalidInput(let input):
            return "Errors: Invalid input: " + input
        }
    }
}
