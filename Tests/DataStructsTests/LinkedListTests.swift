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
    
    func testPushValue() {
        let value = 5
        var list = LinkedList<Int>()
        let head = Node(value: 1)
        let tail = Node(value: 2)
        
        head.next = tail
        list.head = head
        list.tail = tail
        
        list.push(value)
        
        XCTAssertTrue(list.head?.value == value)
        XCTAssertTrue(list.head?.next?.value == head.value)
        XCTAssertTrue(list.tail?.value == tail.value)
        
        print(list)
    }
    
    func testPushValueInEmptyLinkedList() {
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
    
    func testPushNodeInEmptyLinkedList() {
        var list = LinkedList<String>()
        let newNode = Node(value: "hello")
        list.push(newNode)
        
        XCTAssertTrue(list.head == newNode)
        
        print(list)
    }
    
    func testAppendValue() {
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
    
    func testNodeAtIndex() {
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
    
    func testInsertValueAfterNode() {
        let appendings: [Int] = [1,2,3,5]
        var list = LinkedList<Int>()
        
        appendings.forEach({
            list.append($0)
        })
        
        guard let nodeAfterInsert = list.node(at: 2) else { return }
        list.insert(value: 4, after: nodeAfterInsert)
        let lastNode = list.insert(value: 6, after: list.tail)
        
        XCTAssertTrue(list.node(at: 2)?.value == nodeAfterInsert.value)
        XCTAssertTrue(list.node(at: 3)?.value == 4)
        XCTAssertTrue(lastNode?.next == nil)
        
        print(list)
    }
    
    func testInsertNodeAfterNode() {
        var list = LinkedList(values: [1,2,3,4,5])
        let nextNode = Node(value: 10)
        list.insert(node: nextNode, afterNode: list.head)
        
        XCTAssertTrue(list.head?.next?.value == nextNode.value)
        
        print(list)
    }
    
    func testInsertInEmptyList() {
        var list = LinkedList<Int>()
        list.insert(value: 99, after: list.head)
        
        XCTAssertTrue(list.head == list.tail)
        
        print(list)
    }
    
    func testInsertValueInEmpty() {
        var list = LinkedList<Int>()
        let node1 = Node(value: 5)
        let node2 = Node(value: 6)
        
        list.insert(node: node1, afterNode: list.head)
        list.insert(node: node2, afterNode: list.head)
        
        XCTAssertTrue(list.head?.value == 5)
        XCTAssertTrue(list.tail?.value == 6)
        
        print(list)
    }
    
    func testInsertNodeInEmpty() {
        var list = LinkedList<Int>()
        
        list.insert(value: 1, after: list.head)
        list.insert(value: 2, after: list.head)
        
        XCTAssertTrue(list.head?.value == 1)
        XCTAssertTrue(list.tail?.value == 2)
        
        print(list)
    }
    
    func testPop() {
        var list = LinkedList<Int>()
        let head = Node(value: 1)
        let tail = Node(value: 2)
        head.next = tail
        list.head = head
        list.tail = tail
        
        list.pop()
        XCTAssertTrue(list.head?.value == tail.value)
        
        list.pop()
        XCTAssertTrue(list.isEmpty)
    }
    
    func testRemoveLast() {
        var list = LinkedList(values: [1,2,3,4,5])
        
        let last = list.removeLast()
        
        XCTAssertTrue(last == 5)
        
        list.removeLast()
        
        XCTAssertTrue(list.tail?.value == 3)
        
        print(list)
    }
    
    func testRemoveAfterNodeByValue() {
        var list = LinkedList(values: [1,2,3])
        let newNode = Node(value: 4)
        list.append(newNode)
        list.append(5)
        list.append(6)
        list.remove(after: newNode)
        
        XCTAssertTrue(newNode.next?.value == 6)
        
        print(list)
    }
    
    func testStartIndexSubscript() {
        let list = LinkedList(values: [1,2,3])
        XCTAssertTrue(list[list.startIndex] == 1)
        XCTAssertFalse(list[list.startIndex] == 3)
    }
    
    func testEndIndexSubscript() {
        let list = LinkedList(values: [1,2,3])
        XCTAssertFalse(list[list.endIndex] == 1)
        XCTAssertTrue(list[list.endIndex] == 3)
    }
    
    func testIndexAfterSubscript() {
        var list = LinkedList(values: [1,2,3])
        let newNode = Node(value: 55)
        list.push(newNode)
        
        let index = LinkedList.Index(node: newNode)
        XCTAssertTrue(list[list.index(after: index)] == 1)
        
        print(list)
    }
    
    func testSubscript() {
        var list = LinkedList(values: [11,22,33])
        let newNode = Node(value: 55)
        list.push(newNode)
        
        let index = LinkedList.Index(node: newNode)
        XCTAssertTrue(list[index] == 55)
        
        let index2 = LinkedList.Index(node: list.node(at: 3))
        XCTAssertTrue(list[index2] == 33)
    }
    
    func testValueSemantics() {
        var list1 = LinkedList(values: [1,2,3])
        var list2 = list1
        XCTAssertTrue(list2 == list1)
        
        list1.append(4)
        
        XCTAssertNotEqual(list1, list2)
        
        print(list1, list2)
        
        withUnsafePointer(to: &list1) { pointer in
            print("Memory address of list1: \(pointer)")
        }
        
        withUnsafePointer(to: &list2) { pointer in
            print("Memory address of list2: \(pointer)")
        }
    }
}
