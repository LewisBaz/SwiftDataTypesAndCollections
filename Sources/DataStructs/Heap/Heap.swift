//
//  Heap.swift
//  DataStructs
//
//  Created by Lewis on 22.07.2026.
//

public struct Heap<Element> {
    
    private var storage: [Element] = []
    let isHigherPriority: (Element, Element) -> Bool
    
    public init(isHigherPriority: @escaping (Element, Element) -> Bool) {
        self.isHigherPriority = isHigherPriority
    }
    
    private func parentIndex(of index: Int) -> Int { (index - 1) / 2 }
    private func leftChildIndex(of index: Int) -> Int { 2 * index + 1 }
    private func rightChildIndex(of index: Int) -> Int { 2 * index + 2 }
    
    // O(log n)
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: index)
        while child > 0, isHigherPriority(storage[child], storage[parent]) {
            storage.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    // O(log n)
    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(of: parent)
            let right = rightChildIndex(of: parent)
            var candidate = parent
            
            if left < storage.count, isHigherPriority(storage[left], storage[candidate]) {
                candidate = left
            }
            if right < storage.count, isHigherPriority(storage[right], storage[candidate]) {
                candidate = right
            }
            
            guard candidate != parent else { return }
            storage.swapAt(candidate, parent)
            parent = candidate
        }
    }
    
    public mutating func insert(_ element: Element) {
        storage.append(element)
        siftUp(from: storage.count - 1)
    }
    
    public mutating func extract() -> Element? {
        guard !storage.isEmpty else { return nil }
        storage.swapAt(0, storage.count - 1)
        let removed = storage.removeLast()
        if !storage.isEmpty {
            siftDown(from: 0)
        }
        return removed
    }
}
