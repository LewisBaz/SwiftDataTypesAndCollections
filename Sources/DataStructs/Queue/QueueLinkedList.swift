//
//  QueueLinkedList.swift
//
//
//  Created by Lewis on 16.08.2024.
//

import Foundation

public struct QueueLinkedList<T: Equatable>: Queue {
    
    public typealias Element = T
    
    private var list = DoubleLinkedList<Element>()
    
    public init() {}
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public var peek: Element? {
        list.head?.value
    }
    
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        list.append(element)
        return true
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        guard !list.isEmpty, let element = list.head else { return nil }
        return list.remove(element)
    }
}

extension QueueLinkedList: CustomStringConvertible {
    
    public var description: String {
        return list.description
    }
}
