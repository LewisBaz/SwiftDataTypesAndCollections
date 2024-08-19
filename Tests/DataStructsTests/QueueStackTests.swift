//
//  QueueStackTests.swift
//
//
//  Created by Lewis on 19.08.2024.
//

import XCTest
@testable import DataStructs

final class QueueStackTests: XCTestCase {
    
    func testStack() {
        var stack = QueueStack<String>()
        stack.enqueue("uu")
        stack.enqueue("ii")
        stack.dequeue()
        
        XCTAssertTrue(stack.peek == "ii")
        
        print(stack)
    }
}
