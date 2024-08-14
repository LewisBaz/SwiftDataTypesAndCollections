//
//  Stack.swift
//  
//
//  Created by Lewis on 13.08.2024.
//

import Foundation

public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() {}
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public var count: Int {
        storage.count
    }
    
    public var isEmpty: Bool {
        storage.isEmpty
    }
    
    /// Time Complexity: O(1)
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    /// Time Complexity: O(1)
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    /// Time Complexity: O(1)
    public func peek() -> Element? {
        storage.last
    }
}

extension Stack: ExpressibleByArrayLiteral {
    
    public typealias ArrayLiteralElement = Element
    
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n-----------"
        let stackElements = storage
            .map { "\($0)" }
            .reversed()
            .joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}
