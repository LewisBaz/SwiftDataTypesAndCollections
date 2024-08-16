//
//  File.swift
//  
//
//  Created by Lewis on 14.08.2024.
//

import XCTest
@testable import DataStructs

final class DoubleLinkedListTests: XCTestCase {
    
    private func printFromHead<T>(_ list: DoubleLinkedList<T>) {
        var str = String()
        var currentNode = list.head
        while currentNode != nil {
            if !str.isEmpty { str.append(" -> ") }
            str.append(String(describing: currentNode!.value))
            currentNode = currentNode?.next
        }
        str.insert(contentsOf: "head: ", at: str.startIndex)
        print(str)
    }
    
    private func printFromTail<T>(_ list: DoubleLinkedList<T>) {
        var str = String()
        var currentNode = list.tail
        while currentNode != nil {
            if !str.isEmpty { str.append(" -> ") }
            str.append(String(describing: currentNode!.value))
            currentNode = currentNode?.prev
        }
        str.insert(contentsOf: "tail: ", at: str.startIndex)
        print(str)
    }
    
    func testPush() {
        var list = DoubleLinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)
        
        XCTAssertTrue(list.head?.value == 3)
        XCTAssertTrue(list.tail?.value == 1)

        printFromHead(list)
        printFromTail(list)
    }
    
    func testAppend() {
        var list = DoubleLinkedList<Int>()
        list.append(1)
        list.append(5)
        list.append(8)
        
        printFromHead(list)
        printFromTail(list)
    }
    
    func testPushAndAppend() {
        var list = DoubleLinkedList<Int>()
        list.append(7)
        list.append(4)
        list.push(2)
        list.append(10)
        list.push(88)
        list.append(44)
        
        XCTAssertTrue(list.tail?.value == 44)
        XCTAssertTrue(list.head?.value == 88)
        
        printFromHead(list)
        printFromTail(list)
    }
    
    func testRemove() {
        var list = DoubleLinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        list.remove(list.tail)
        list.remove(list.head)
        list.remove(list.head)
        
        XCTAssertTrue(list.isEmpty)
        
        printFromHead(list)
        printFromTail(list)
    }
}
