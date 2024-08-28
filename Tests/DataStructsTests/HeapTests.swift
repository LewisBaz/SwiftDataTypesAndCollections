//
//  HeapTests.swift
//
//
//  Created by Lewis on 28.08.2024.
//

import XCTest
@testable import DataStructs

final class HeapTests: XCTestCase {
    
    func testInsert() {
        var heap = Heap(sort: >, elements: [1,12,3,4,1,6,8,7])
        XCTAssertEqual(heap.peek(), 12)
        heap.insert(15)
        XCTAssertEqual(heap.peek(), 15)
        heap.insert(13)
        XCTAssertEqual(heap.peek(), 15)
        print(heap.elements)
    }
    
    func testIndexOf() {
        let heap = Heap(sort: >, elements: [1,4,18,7,10,5])
        print(heap.elements)
        let index1 = heap.index(of: 5, startingAt: 0)
        let index2 = heap.index(of: 1, startingAt: 0)
        XCTAssertEqual(index1, 2)
        XCTAssertEqual(index2, 5)
    }
    
    func testRemove() {
        var heap = Heap(sort: >, elements: [1,12,3,4,1,6,8,7])
        let r = heap.remove()
        XCTAssertEqual(r, 12)
    }
    
    func testRemoveAt() {
        var heap = Heap(sort: >, elements: [1,12,3,4,1,6,8,7])
        let r = heap.remove(at: 0)
        XCTAssertEqual(r, 12)
        let r2 = heap.remove(at: 1)
        XCTAssertEqual(r2, 7)
    }
}
