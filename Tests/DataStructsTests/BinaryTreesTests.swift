//
//  BinaryTreesTests.swift
//
//
//  Created by Lewis on 22.08.2024.
//

import XCTest
@testable import DataStructs

final class BinaryTreesTests: XCTestCase {
    
    private var tree: BinaryNode<Int> {
        let zero = BinaryNode(value: 0)
        let one = BinaryNode(value: 1)
        let five = BinaryNode(value: 5)
        let seven = BinaryNode(value: 7)
        let eight = BinaryNode(value: 8)
        let nine = BinaryNode(value: 9)
        seven.leftChild = one
        one.leftChild = zero
        one.rightChild = five
        seven.rightChild = nine
        nine.leftChild = eight
        return seven
    }
    
    func testBinaryTree() {
        let tree = tree
        XCTAssertTrue(tree.value == 7)
        XCTAssertTrue(tree.leftChild?.value == 1)
        XCTAssertTrue(tree.rightChild?.value == 9)
        print(tree)
    }
    
    func testTraverseInOrder() {
        let tree = tree
        var treeInList: [Int] = []
        tree.traverseInOrder(visit: { treeInList.append($0) })
        print(treeInList)
        XCTAssertTrue(treeInList.first == 0)
        XCTAssertTrue(treeInList.last == 9)
    }
    
    func testTraversePreOrder() {
        let tree = tree
        var treeInList: [Int] = []
        tree.traversePreOrder(visit: { treeInList.append($0) })
        print(treeInList)
        XCTAssertTrue(treeInList.first == 7)
        XCTAssertTrue(treeInList.last == 8)
    }
    
    func testTraversePostOrder() {
        let tree = tree
        var treeInList: [Int] = []
        tree.traversePostOrder(visit: { treeInList.append($0) })
        print(treeInList)
        XCTAssertTrue(treeInList.first == 0)
        XCTAssertTrue(treeInList.last == 7)
    }
    
    func testMin() {
        let tree = tree
        XCTAssertTrue(tree.min.value == 0)
    }
}
