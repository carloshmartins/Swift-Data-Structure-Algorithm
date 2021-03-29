import Foundation

/*
 
 NODE
 As the diagram suggests, a linked list is a chain of nodes. Nodes have two responsibilities:
 1. Hold a value.
 2. Hold a reference to the next node. A nil value represents the end of the list.
 */

public class Node<Value> {
    public var value: Value?
    public var next: Node?
    
    public init(value: Value? = nil, next: Node<Value>? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(String(describing: value))"
        }
        return "\(String(describing: value)) -> " + String(describing: next) + " "
    }
}

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    // A.K.A "head-first insertion
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
          return "Empty list"
        }
        return String(describing: head)
      }
}
