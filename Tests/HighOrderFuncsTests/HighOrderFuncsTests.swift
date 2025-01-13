//
//  HighOrderFuncsTests.swift
//
//
//  Created by Lewis on 11.01.2025.
//

import XCTest
@testable import HighOrderFuncs

final class HighOrderFuncsTests: XCTestCase {
    
    func testFilter() {
        let array = [1,2,3].filterToNewCollection { e in e == 2 }
        XCTAssertTrue(array == [2])
        
        let set = Set([1,2,3]).filterToNewSet { e in e == 1 }
        XCTAssertTrue(set == Set([1]))
        
        let dict = [1:1, 2:2, 3:3].filterToNewDictionary { e in e.key == 3 }
        XCTAssertTrue(dict == [3:3])
    }
    
    func testMap() {
        let array = ["123", "456"].customMap { e in
            return Int(e)!
        }
        XCTAssertTrue(array == [123, 456])
        
        let testable2: [Int?] = [12, nil, 56]
        let array2 = testable2.customCompactMap { $0 }
        XCTAssertTrue(array2 == [12, 56])
    }
    
    func testReduce() {
        let array = [1,2,3,4,5]
        let val = array.customReduce(0) { val, next in
            val + next
        }
        XCTAssertTrue(val == 15)
    }
    
    func testCountWhere() {
        let array = [1,2,3,4,5]
        let count = array.countWhere(action: { $0 % 2 == 0 })
        XCTAssertTrue(count == 2)
    }
}
