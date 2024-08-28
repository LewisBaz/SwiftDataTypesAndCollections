//
//  Heap.swift
//
//
//  Created by Lewis on 26.08.2024.
//

import Foundation

public struct Heap<Element: Equatable> {
    
    public var elements: [Element] = []
    public let sort: (Element, Element) -> Bool
    
    public init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public func peek() -> Element? {
        return elements.first
    }
    
    public func leftChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 1
    }
    
    public func rightChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 2
    }
    
    public func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
    
    public mutating func remove() -> Element? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()
    }
    
    /// Time Complexity: O(log n)
    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if parent == candidate {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    public mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    public mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else { return nil }
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }
    
    public func index(of element: Element, startingAt i: Int) -> Int? {
        if i >= count {
            return nil
        }
        if sort(element, elements[i]) {
            return nil
        }
        if element == elements[i] {
            return i
        }
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        return nil
    }
}
