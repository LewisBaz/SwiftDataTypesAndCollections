//
//  LinkedList.swift
//
//
//  Created by Lewis on 08.08.2024.
//

import Foundation

public struct LinkedList<Value>: Equatable {
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
        copyNodes()
        head = .init(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// Time Complexity: O(1)
    public mutating func push(_ node: Node<Value>) {
        copyNodes()
        node.next = head
        head = node
        if tail == nil {
            tail = head
        }
    }
    
    /// Time Complexity: O(1)
    public mutating func append(_ value: Value) {
        guard !isEmpty else { push(value); return }
        copyNodes()
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    /// Time Complexity: O(1)
    public mutating func append(_ node: Node<Value>) {
        guard !isEmpty else { push(node); return }
        copyNodes()
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
        let node = copyNodes(withNode: node)
        guard tail != node else { append(value); return tail }
        node?.next = Node(value: value, next: node?.next)
        if head == tail {
            head?.next = node?.next
            tail = node?.next
        }
        return node?.next
    }
    
    /// Time Complexity: O(1)
    public mutating func insert(node: Node<Value>, afterNode: Node<Value>?) {
        let afterNode = copyNodes(withNode: afterNode)
        guard tail != afterNode else { append(node); return }
        afterNode?.next = node
        if head == tail {
            head?.next = afterNode?.next
            tail = afterNode?.next
        }
        afterNode?.next = node
    }
    
    // MARK: - Removing
    
    /// Time Complexity: O(1)
    @discardableResult
    public mutating func pop() -> Value? {
        copyNodes()
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
        copyNodes()
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
        copyNodes()
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

extension LinkedList: Collection {
    
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        
        public static func < (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            guard lhs != rhs else { return false }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains(where: { $0 === rhs.node })
        }
    }
    
    public var startIndex: Index {
        return .init(node: head)
    }
    
    public var endIndex: Index {
        return .init(node: tail)
    }
    
    public func index(after i: Index) -> Index {
        return .init(node: i.node?.next)
    }

    public subscript(position: Index) -> Value {
        return position.node!.value
    }
}

// MARK: - Private Methods

private extension LinkedList {
    
    mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else { return }
        guard var oldNode = head else { return }
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode?.next = Node(value: nextOldNode.value)
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        tail = newNode
    }
    
    mutating func copyNodes(withNode: Node<Value>?) -> Node<Value>? {
        guard !isKnownUniquelyReferenced(&head) else { return withNode }
        guard var oldNode = head else { return nil }
        head = Node(value: oldNode.value)
        var newNode = head
        
        var nodeToReturn: Node<Value>?
        
        if let withNode {
            nodeToReturn = .init(value: withNode.value)
        }
        
        while let nextOldNode = oldNode.next {
            newNode?.next = Node(value: nextOldNode.value)
            if withNode == oldNode {
                nodeToReturn = newNode
            }
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        tail = newNode
        return nodeToReturn
    }
}

// MARK: - CustomStringConvertible

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else { return "Empty list" }
        return String(describing: head)
    }
}
