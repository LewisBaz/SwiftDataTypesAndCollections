//
//  Map.swift
//
//
//  Created by Lewis on 13.01.2025.
//

import Foundation

extension Sequence where Self: RangeReplaceableCollection {
    
    func customMap<T>(_ transform: ((Element) throws -> T)) rethrows -> [T] {
        var result: [T] = []
        result.reserveCapacity(self.count)
        for element in self {
            result.append(try transform(element))
        }
        return result
    }
    
    func customCompactMap<T>(_ transform: ((Element) throws -> T?)) rethrows -> [T] {
        var result: [T] = []
        result.reserveCapacity(self.count)
        for element in self {
            if let value = try transform(element) {
                result.append(value)
            }
        }
        return result
    }
}
