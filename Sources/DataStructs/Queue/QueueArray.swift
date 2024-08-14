//
//  QueueArray.swift
//
//
//  Created by Lewis on 14.08.2024.
//

import Foundation

public struct QueueArray<T>: Queue {
    
    public typealias Element = T
    
    private var array = Array<Element>()
    
    public init() {
        
    }
    
    public var count: Int {
        array.count
    }
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    /// Time Complexity: O(1)
    public var peek: Element? {
        array.first
    }
    
    /// Time Complexity: O(1)
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        array.append(element)
        return true
    }
    
    /// Time Complexity: O(n)
    @discardableResult
    public mutating func dequeue() -> Element? {
        isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    
    public var description: String {
        return array.description
    }
}
