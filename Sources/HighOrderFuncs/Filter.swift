//
//  Filter.swift
//
//
//  Created by Lewis on 11.01.2025.
//

import Foundation

extension Sequence where Self: RangeReplaceableCollection {
    
    func filterToNewCollection(_ condition: ((Element) throws -> Bool)) rethrows -> Self {
        var result = Self()
        for element in self {
            if try condition(element) {
                result.append(element)
            }
        }
        return result
    }
}

extension Sequence where Self: Collection, Element: Hashable {
    
    func filterToNewSet(_ condition: ((Element) throws -> Bool)) rethrows -> Set<Element> {
        var result = Set<Element>()
        for element in self {
            if try condition(element) {
                result.insert(element)
            }
        }
        return result
    }
}

extension Dictionary {
    
    func filterToNewDictionary(_ condition: ((Element) throws -> Bool)) rethrows -> Self {
        var result: [Key : Value] = [:]
        for element in self {
            if try condition(element) {
                result[element.key] = element.value
            }
        }
        return result
    }
}
