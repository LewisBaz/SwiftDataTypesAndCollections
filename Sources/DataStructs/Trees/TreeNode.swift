//
//  TreeNode.swift
//
//
//  Created by Lewis on 19.08.2024.
//

import Foundation

public class TreeNode<T> {
    
    public var value: T
    public var children: [TreeNode]
    
    public init(value: T, children: [TreeNode] = []) {
        self.value = value
        self.children = children
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode {
    
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach({ $0.forEachDepthFirst(visit: visit) })
    }
    
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = QueueArray<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach({ queue.enqueue($0) })
        }
    }
}

public extension TreeNode where T: Equatable {
    
    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}

extension TreeNode: CustomStringConvertible {
    
    public var description: String {
        return "Value `\(value)` have children: \(children)"
    }
}
