//
//  StackTests.swift
//
//
//  Created by Lewis on 13.08.2024.
//

import XCTest
@testable import DataStructs

final class StackTests: XCTestCase {
    
    func testPush() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(10)
        stack.push(100)
        
        XCTAssertTrue(stack.count == 3)
        XCTAssertTrue(stack.peek() == 100)
        
        print(stack)
    }
    
    func testPop() {
        var stack = Stack<String>()
        stack.push("a")
        stack.push("b")
        
        XCTAssertTrue(stack.peek() == "b")
        
        stack.pop()
        
        XCTAssertTrue(stack.peek() == "a")
        
        print(stack)
    }
    
    func testInits() {
        var stack1 = Stack(["a", "z"])
        var stack2: Stack = [1,2,3]
        
        XCTAssertEqual(stack1.pop(), "z")
        XCTAssertEqual(stack2.pop(), 3)
    }
}
