//
//  QueueArrayTests.swift
//
//
//  Created by Lewis on 14.08.2024.
//

import XCTest
@testable import DataStructs

final class QueueArrayTests: XCTestCase {
    
    func testEnqueue() {
        var queue = QueueArray<Int>()
        queue.enqueue(1)
        queue.enqueue(11)
        
        XCTAssertTrue(queue.count == 2)
        XCTAssertEqual(queue.peek, 1)
        
        print(queue)
    }
    
    func testDequeue() {
        var queue = QueueArray<Int>()
        queue.enqueue(0)
        queue.enqueue(1)
        queue.enqueue(2)
        queue.dequeue()
        
        XCTAssertTrue(queue.count == 2)
        XCTAssertEqual(queue.peek, 1)
        
        print(queue)
    }
    
    func testPeek() {
        var queue = QueueArray<String>()
        queue.enqueue("a")
        XCTAssertEqual(queue.peek, "a")
        queue.enqueue("b")
        XCTAssertEqual(queue.peek, "a")
        queue.dequeue()
        XCTAssertEqual(queue.peek, "b")
    }
}
