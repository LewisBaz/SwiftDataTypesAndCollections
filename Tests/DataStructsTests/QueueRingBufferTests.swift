//
//  QueueRingBufferTests.swift
//
//
//  Created by Lewis on 19.08.2024.
//

import XCTest
@testable import DataStructs

final class QueueRingBufferTests: XCTestCase {
    
    func testEnqueue() {
        var ringBuffer = QueueRingBuffer<Int>(count: 4)
        ringBuffer.enqueue(5)
        ringBuffer.enqueue(6)
        ringBuffer.enqueue(7)
        let result1 = ringBuffer.enqueue(8)
        let result2 = ringBuffer.enqueue(1)
        
        XCTAssertTrue(result1 == true)
        XCTAssertTrue(result2 == false)
        
        print(ringBuffer)
    }
    
    func testDequeue() {
        var ringBuffer = QueueRingBuffer<Int>(count: 4)
        ringBuffer.enqueue(5)
        ringBuffer.enqueue(6)
        ringBuffer.enqueue(7)
        ringBuffer.dequeue()
        
        XCTAssertTrue(ringBuffer.peek == 6)
        
        ringBuffer.enqueue(90)
        ringBuffer.dequeue()
        ringBuffer.dequeue()
        
        XCTAssertTrue(ringBuffer.peek == 90)
        
        ringBuffer.dequeue()
        
        XCTAssertTrue(ringBuffer.isEmpty)
        
        print(ringBuffer)
    }
}
