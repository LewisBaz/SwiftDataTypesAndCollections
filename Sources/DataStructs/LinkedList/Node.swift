//
//  Node.swift
//  
//
//  Created by Lewis on 08.08.2024.
//

import Foundation

public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: Equatable {
    
    public static func == (lhs: Node<Value>, rhs: Node<Value>) -> Bool {
        return lhs === rhs
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next else { return "\(value)"}
        return "\(value) -> " + String(describing: next) + " "
    }
}
