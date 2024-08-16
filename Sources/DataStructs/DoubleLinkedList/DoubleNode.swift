//
//  DoubleNode.swift
//
//
//  Created by Lewis on 14.08.2024.
//

import Foundation

public class DoubleNode<Value> {
    var value: Value
    var next: DoubleNode?
    var prev: DoubleNode?
    
    public init(value: Value, next: DoubleNode? = nil, prev: DoubleNode? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}

extension DoubleNode: Equatable {
    
    public static func == (lhs: DoubleNode<Value>, rhs: DoubleNode<Value>) -> Bool {
        return lhs === rhs
    }
}
