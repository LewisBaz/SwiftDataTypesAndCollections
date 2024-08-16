//
//  QueueLinkedListTests.swift
//
//
//  Created by Lewis on 16.08.2024.
//

import XCTest
@testable import DataStructs

final class QueueLinkedListTests: XCTestCase {
    
    func testEnqueue() {
        var queue = QueueLinkedList<Int>()
        queue.enqueue(88)
        queue.enqueue(44)
        
        XCTAssertTrue(queue.peek == 88)
        
        queue.enqueue(99)
        queue.dequeue()
        
        XCTAssertTrue(queue.peek == 44)
        
        print(queue)
    }
    
    func testDequeue() {
        var queue = QueueLinkedList<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssertEqual(queue.dequeue(), 1)
        
        queue.enqueue(4)
        
        XCTAssertTrue(queue.peek == 2)
        
        queue.dequeue()
        queue.dequeue()
        queue.dequeue()
        
        XCTAssertTrue(queue.isEmpty)
        
        print(queue)
    }
}
