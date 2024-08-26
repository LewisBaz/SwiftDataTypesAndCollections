//
//  BinarySearchTests.swift
//
//
//  Created by Lewis on 26.08.2024.
//

import XCTest
@testable import DataStructs

final class BinarySearchTests: XCTestCase {
    
    func testBinarySearch() {
        let case1 = BinarySearch(v: 9, in: [1,2,3,4,5,6,7,8,9,10]).search()
        XCTAssertEqual(case1, 8)
        let case2 = BinarySearch(v: 0, in: [1,2,3]).search()
        XCTAssertNil(case2)
        let case3 = BinarySearch(v: 1, in: []).search()
        XCTAssertNil(case3)
        let case4 = BinarySearch(v: 1, in: [1]).search()
        XCTAssertEqual(case4, 0)
    }
}
