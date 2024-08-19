//
//  QueueRingBuffer.swift
//
//
//  Created by Lewis on 16.08.2024.
//

import Foundation

public struct QueueRingBuffer<T>: Queue {
    
    public typealias Element = T
    
    private var ringBuffer: RingBuffer<Element>
    
    public init(count: Int) {
        ringBuffer = RingBuffer<Element>(count: count)
    }
    
    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }
    
    public var peek: Element? {
        ringBuffer.first
    }
    
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        ringBuffer.write(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        isEmpty ? nil : ringBuffer.read()
    }
}
