/*
 There are only two essential operations for a stack:
 • push: Adding an element to the top of the stack.
 • pop: Removing the top element of the stack.
 
 LIFO
 
 Examples:
    - Navigation Stack
    - Memory Allocation
    - Search and Conquer Algorithms, to find a path out of a maze, facilitate backtracking
 
 Complexity (Push and Pop) ->>>>  O(1) time complexity
 
 Topics Learned:
 - Generics in Struct
 - Mutating Function
 - Discardable Result
 - CustomStringConvertible
 
 Key points
 • A stack is a LIFO, last-in first-out, data structure.
 • Despite being so simple, the stack is a key data structure for many problems.Stacks are crucial to problems that search trees and graphs.
 • The only two essential operations for the stack are the push method for adding elements and the pop method for removing elements.
*/

import Foundation

public struct Stack<Element>: ExpressibleByArrayLiteral {
    
    public typealias ArrayLiteralElement = Element
    
    private var storage: [Element] = []
    
    public init() {}
    
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
     storage.last
    }
    public var isEmpty: Bool {
      peek() == nil
    }
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)" }.reversed().joined(separator:
        "\n"))
        -----------
        """
    }
}

