//
//  Reduce.swift
//
//
//  Created by Lewis on 13.01.2025.
//

import Foundation

extension Sequence {
    
    func customReduce<T>(_ initialVal: T, _ nextVal: (T, Element) -> T) -> T {
        var result = initialVal
        for element in self {
            result = nextVal(result, element)
        }
        return result
    }
}
