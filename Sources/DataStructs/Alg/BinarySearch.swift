//
//  BinarySearch.swift
//
//
//  Created by Lewis on 26.08.2024.
//

import Foundation

public struct BinarySearch<Value: Comparable> {
    let v: Value
    let collection: [Value]
    
    public init(v: Value, in collection: [Value]) {
        self.v = v
        self.collection = collection
    }
    
    func search() -> Int? {
        var lowerBound = 0
        var upperBound = collection.count
        
        while lowerBound < upperBound {
            let mid = lowerBound + (upperBound - lowerBound) / 2
            if collection[mid] == v {
                return mid
            } else if collection[mid] > v {
                upperBound = mid
            } else {
                lowerBound = mid + 1
            }
        }
        
        return nil
    }
}
