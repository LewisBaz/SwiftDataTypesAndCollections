//
//  DoubleLinkedList.swift
//
//
//  Created by Lewis on 14.08.2024.
//

import Foundation

public struct DoubleLinkedList<Value: Equatable> {
    
    public var head: DoubleNode<Value>?
    public var tail: DoubleNode<Value>?
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public init(head: DoubleNode<Value>? = nil, tail: DoubleNode<Value>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    public mutating func push(_ value: Value) {
        let node = DoubleNode(value: value)
        if isEmpty {
            head = node
            tail = node
        } else {
            node.next = head
            head = node
            head?.next?.prev = head
        }
    }
    
    public mutating func append(_ value: Value) {
        guard !isEmpty else { push(value); return }
        let node = DoubleNode(value: value)
        node.prev = tail
        tail?.next = node
        tail = tail?.next
    }
    
    public mutating func remove(_ node: DoubleNode<Value>?) {
        var currentNode = head
        
        if head == node {
            removeHead()
        }
        if tail == node {
            removeTail()
        }
        
        while currentNode != nil {
            if currentNode == node {
                let prev = currentNode?.prev
                let next = currentNode?.next
                prev?.next = next
                next?.prev = prev
                return
            }
            currentNode = currentNode?.next
        }
    }
}

// MARK: - Private Methods

private extension DoubleLinkedList {
    
    mutating func removeHead() {
        if tail == head {
            removeTail()
        }
        head = head?.next
        head?.prev = nil
    }
    
    mutating func removeTail() {
        tail?.prev?.next = nil
        tail = tail?.prev
    }
}
