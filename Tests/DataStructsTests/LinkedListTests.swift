import XCTest
@testable import DataStructs

final class LinkedListTests: XCTestCase {
    
    func testNodes() {
        let head = Node(value: 1)
        let middle = Node(value: 2)
        let tail = Node(value: 3)
        
        head.next = middle
        middle.next = tail
        
        XCTAssertNil(tail.next)
        XCTAssertTrue(middle.value == 2)
        
        print(head)
    }
    
    func testLinkedList() {
        var list = LinkedList<Int>()
        let head = Node(value: 1)
        let middle = Node(value: 2)
        let tail = Node(value: 3)
        
        head.next = middle
        middle.next = tail
        list.head = head
        
        XCTAssertTrue(list.head === head)
        XCTAssertTrue(list.head?.next?.next?.value == 3)
        
        print(list)
    }
    
    func testPushInLinkedList() {
        let value = 5
        var list = LinkedList<Int>()
        let head = Node(value: 1)
        let tail = Node(value: 2)
        
        head.next = tail
        list.head = head
        list.tail = tail
        
        list.push(value)
        
        XCTAssertTrue(list.head?.value == value)
        XCTAssertTrue(list.head?.next == head)
        XCTAssertTrue(list.tail == tail)
        
        print(list)
    }
    
    func testPushInEmptyLinkedList() {
        let value = 10
        var list = LinkedList<Int>()
        list.push(value)
        
        XCTAssertTrue(list.head == list.tail)
        XCTAssertTrue(list.head?.value == value)
        
        let newHeadValue = 15
        list.push(11)
        list.push(newHeadValue)
        
        XCTAssertTrue(list.head?.value == newHeadValue)
        
        print(list)
    }
    
    func testPushNode() {
        var list = LinkedList(values: ["aa", "bb"])
        let newNode = Node(value: "cc")
        list.push(newNode)
        
        XCTAssertTrue(list.head == newNode)
        XCTAssertTrue(list.head?.next?.value == "aa")
        
        print(list)
    }
    
    func testAppendInLinkedList() {
        let appendings: [Int] = [5,6,7]
        var list = LinkedList<Int>()
        
        appendings.forEach({
            list.append($0)
        })
        
        XCTAssertTrue(list.head?.value == 5)
        XCTAssertTrue(list.tail?.value == 7)
        
        print(list)
    }
    
    func testAppendNode() {
        var list = LinkedList(values: [true, true])
        let newNode = Node(value: false)
        list.append(newNode)
        
        XCTAssertTrue(list.tail?.value == false)
        
        print(list)
    }
    
    func testNodeAtIndexInLinkedList() {
        let appendings: [Int] = [1,2,3]
        var list = LinkedList<Int>()
        
        appendings.forEach({
            list.append($0)
        })
        
        let first = list.node(at: 0)
        let last = list.node(at: appendings.count - 1)
        let empty = list.node(at: appendings.count)
        
        XCTAssertTrue(first?.value == 1)
        XCTAssertTrue(last?.value == 3)
        XCTAssertTrue(empty == nil)
    }
    
    func testInsertAfterInLinkedList() {
        let appendings: [Int] = [1,2,3,5]
        var list = LinkedList<Int>()
        
        appendings.forEach({
            list.append($0)
        })
        
        guard let nodeAfterInsert = list.node(at: 2) else { return }
        list.insert(value: 4, after: nodeAfterInsert)
        let lastNode = list.insert(value: 6, after: list.tail)
        
        XCTAssertTrue(list.node(at: 2) == nodeAfterInsert)
        XCTAssertTrue(list.node(at: 3)?.value == 4)
        XCTAssertTrue(lastNode?.next == nil)
        
        print(list)
    }
    
    func testInsertAfterNode() {
        var list = LinkedList(values: [1,2,3,4,5])
        let nextNode = Node(value: 10)
        list.insert(node: nextNode, afterNode: list.head)
        
        XCTAssertTrue(list.head?.next == nextNode)
        
        print(list)
    }
    
    func testPopInLinkedList() {
        var list = LinkedList<Int>()
        let head = Node(value: 1)
        let tail = Node(value: 2)
        head.next = tail
        list.head = head
        list.tail = tail
        
        list.pop()
        XCTAssertTrue(list.head == tail)
        
        list.pop()
        XCTAssertTrue(list.isEmpty)
    }
    
    func testRemoveLastInLinkedList() {
        var list = LinkedList(values: [1,2,3,4,5])
        
        let last = list.removeLast()
        
        XCTAssertTrue(last == 5)
        
        list.removeLast()
        
        XCTAssertTrue(list.tail?.value == 3)
        
        print(list)
    }
    
    func testRemoveAfterNodeInLinkedList() {
        var list = LinkedList(values: [1,2,3])
        let newNode = Node(value: 4)
        list.append(newNode)
        list.append(5)
        list.append(6)
        list.remove(after: newNode)
        
        XCTAssertTrue(newNode.next?.value == 6)
        
        print(list)
    }
}
