//
//  Stack.swift
//  calc
//
//  Created by Zhongtao  Chen on 29/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

struct Stack<type> {
    var stackArray: [type] = []
    
    init() {
        self.stackArray = []
    }
    
    mutating func push(item: type) {
        stackArray.append(item)
    }
    
    mutating func pop() -> type? {
        return stackArray.popLast()
    }
    
    func isStackEmpty() -> Bool {
        return stackArray.isEmpty
    }
    
    func toArray() -> [type] {
        return stackArray
    }
}
