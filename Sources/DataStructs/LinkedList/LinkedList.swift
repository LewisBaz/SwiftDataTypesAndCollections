//
//  File.swift
//  
//
//  Created by Lewis on 08.08.2024.
//

import Foundation

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init(head: Node<Value>? = nil, tail: Node<Value>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    public init(values: [Value]) {
        values.forEach({
            append($0)
        })
    }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    // MARK: - Adding
    
    /// Time Complexity: O(1)
    public mutating func push(_ value: Value) {
        head = .init(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// Time Complexity: O(1)
    public mutating func push(_ node: Node<Value>) {
        node.next = head
        head = node
        if tail == nil {
            tail = head
        }
    }
    
    /// Time Complexity: O(1)
    public mutating func append(_ value: Value) {
        guard !isEmpty else { push(value); return }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    /// Time Complexity: O(1)
    public mutating func append(_ node: Node<Value>) {
        guard !isEmpty else { push(node); return }
        tail?.next = node
        tail = tail?.next
    }
    
    /// Time Complexity: O(i) where i is index
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentIndex == index ? currentNode : nil
    }
    
    /// Time Complexity: O(1)
    @discardableResult
    public mutating func insert(value: Value, after node: Node<Value>?) -> Node<Value>? {
        guard let node else { return nil }
        guard tail != node else { append(value); return tail }
        node.next = Node(value: value, next: node.next)
        return node.next
    }
    
    /// Time Complexity: O(1)
    public mutating func insert(node: Node<Value>, afterNode: Node<Value>?) {
        guard let afterNode else { return }
        guard tail != afterNode else { append(node); return }
        node.next = afterNode.next
        afterNode.next = node
    }
    
    // MARK: - Removing
    
    /// Time Complexity: O(1)
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    /// Time Complexity: O(n)
    @discardableResult
    public mutating func removeLast() -> Value? {
        guard let head else { return nil }
        guard head.next != nil else { return pop() }
        
        var previousNode = head
        var currentNode = head
        
        while let nextNode = currentNode.next {
            previousNode = currentNode
            currentNode = nextNode
        }
        
        previousNode.next = nil
        tail = previousNode
        return currentNode.value
    }
    
    /// Time Complexity: O(1)
    @discardableResult
    public mutating func remove(after node: Node<Value>?) -> Value? {
        guard let node else { return nil }
        defer {
            if node.next === nil {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else { return "Empty list" }
        return String(describing: head)
    }
}
