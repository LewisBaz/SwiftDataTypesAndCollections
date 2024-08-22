//
//  TreesTests.swift
//
//
//  Created by Lewis on 19.08.2024.
//

import XCTest
@testable import DataStructs

final class TreesTests: XCTestCase {
    
    func testAddChild() {
        let tree = TreeNode(value: "a")
        tree.add(.init(value: "b"))
        tree.add(.init(value: "c"))
        let child = TreeNode(value: "d")
        child.add(.init(value: "p"))
        tree.add(child)
        
        XCTAssertTrue(child.children.count == 1)
        XCTAssertTrue(tree.children.count == 3)
        
        print(tree)
    }
    
    private func createBigTree() -> TreeNode<Int> {
        let tree = TreeNode(value: 1)
        let two = TreeNode(value: 2)
        let three = TreeNode(value: 3)
        
        let twentyTwo = TreeNode(value: 22)
        let twentyFour = TreeNode(value: 24)
        
        let thirtyTwo = TreeNode(value: 32)
        let thirtyFive = TreeNode(value: 35)
        
        let deepest = TreeNode(value: 1001)
        let muchDeepest = TreeNode(value: 12345)
        
        tree.add(two)
        tree.add(three)
        two.add(twentyTwo)
        two.add(twentyFour)
        three.add(thirtyTwo)
        three.add(thirtyFive)
        twentyFour.add(deepest)
        deepest.add(muchDeepest)
        
        return tree
    }
    
    func testTraverseeDepthFirst() {
        let tree = createBigTree()
        
        var count = 0
        var sum = 0
        
        tree.forEachDepthFirst { node in
            count += 1
            sum += node.value
        }
        
        XCTAssertEqual(count, 9)
        XCTAssertNotEqual(sum, 0)
        
        print(tree)
    }
    
    func testTraverseeLevelOrder() {
        let tree = createBigTree()
        
        var max = 0
        
        tree.forEachLevelOrder { node in
            print(node.value)
            if max < node.value {
                max = node.value
            }
        }
        
        XCTAssertTrue(max == 12345)
    }
    
    func testSearch() {
        let tree = createBigTree()
        let node = tree.search(32)
        XCTAssertTrue(node != nil)
        XCTAssertTrue(node?.value == 32)
    }
}
