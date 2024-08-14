//
//  Queue.swift
//
//
//  Created by Lewis on 14.08.2024.
//

import Foundation

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool {get}
    var peek: Element? {get}
}
