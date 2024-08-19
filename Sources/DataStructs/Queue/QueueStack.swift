//
//  QueueStack.swift
//
//
//  Created by Lewis on 19.08.2024.
//

import Foundation

public struct QueueStack<T>: Queue {
    
    public typealias Element = T
    
    private var leftStack: [Element] = []
    private var rightStack: [Element] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: Element? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    @discardableResult
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}
