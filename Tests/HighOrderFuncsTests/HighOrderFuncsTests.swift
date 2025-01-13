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
}
