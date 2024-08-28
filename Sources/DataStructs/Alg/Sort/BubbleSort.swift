//
//  BubbleSort.swift
//
//
//  Created by Lewis on 28.08.2024.
//

import Foundation

class BubbleSort {
    
    func bubbleSort<Element>(_ collection: inout [Element]) where Element: Comparable {
        guard collection.count >= 2 else { return }
        for end in (1..<collection.count).reversed() {
            var swapped = false
            for current in 0..<end {
                if collection[current] > collection[current + 1] {
                    collection.swapAt(current, current + 1)
                    swapped = true
                }
            }
            if !swapped {
                return
            }
        }
    }
}
