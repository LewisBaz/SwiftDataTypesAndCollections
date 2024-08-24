//
//  BinarySearchTreeTests.swift
//
//
//  Created by Lewis on 23.08.2024.
//

import XCTest
@testable import DataStructs

final class BinarySearchTreeTests: XCTestCase {
    
    func testInsert() {
        var bst = BinarySearchTree<Int>()
        for i in 0..<5 {
            bst.insert(i)
        }
        print(bst)
        XCTAssertTrue(bst.root?.value == 0)
    }
    
    func testContains() {
        var bst = BinarySearchTree<Int>()
        for i in 0..<5 {
            bst.insert(i)
        }
        XCTAssertTrue(bst.contains(0))
        XCTAssertTrue(bst.contains(4))
        XCTAssertFalse(bst.contains(5))
    }
    
    func testRemove() {
        var bst = BinarySearchTree<Int>()
        for i in 0..<5 {
            bst.insert(i)
        }
        bst.remove(0)
        bst.remove(4)
        print(bst)
        XCTAssertTrue(bst.root?.value == 1)
        var max = 0
        bst.root?.traverseInOrder(visit: { val in
            if val > max {
                max = val
            }
        })
        XCTAssertEqual(max, 3)
    }
}
