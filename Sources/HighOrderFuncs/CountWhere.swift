//
//  CountWhere.swift
//
//
//  Created by Lewis on 13.01.2025.
//

import Foundation

extension Array {
    
    func countWhere(action: (Element) -> Bool) -> Int {
        var result = 0
        return self.reduce(result) { iterator, element in
            if action(element) { result += 1 }
            return result
        }
    }
}

extension Array {
    
    func count(where predicate: (Element) -> Bool) -> Int {
        return self.filter(predicate).count
    }
}
