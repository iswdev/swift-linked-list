//
//  Stack.swift
//  swift-data-structures
//
//  Created by User on 2018-12-05.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation


class Stack<Value> {
    
    var elements = [Value]()
    
    func push(_ value: Value){
        elements.append(value)
    }
    
    func pop() -> Value? {
        return elements.popLast()
    }
    
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        let result = elements.map { "[\($0)]" }.joined(separator: "\n")
        return result
    }
    
}
