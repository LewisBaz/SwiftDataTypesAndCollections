//
//  SortTests.swift
//
//
//  Created by Lewis on 28.08.2024.
//

import XCTest
@testable import DataStructs

final class SortTests: XCTestCase {
    
    func testBubbleSort() {
        var collection: [Int] = [1,4,6,2,3,5,2,1,5,0,4,2,6]
        BubbleSort().bubbleSort(&collection)
        print(collection)
        XCTAssertEqual(collection.first, 0)
        XCTAssertEqual(collection.last, 6)
    }
    
    func testSelectionSort() {
        var collection: [Int] = [1,4,6,2,3,5,2,1,5,0,4,2,6]
        SelectionSort().selectionSort(&collection)
        print(collection)
        XCTAssertEqual(collection.first, 0)
        XCTAssertEqual(collection.last, 6)
    }
}
