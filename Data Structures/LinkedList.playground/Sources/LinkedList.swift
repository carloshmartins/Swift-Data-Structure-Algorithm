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
    // Complexity: O(1)
    // A.K.A "head-first insertion
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    /*
     1. Like before, if the list is empty, you’ll need to update both head and tail to the new node. Since append on an empty list is functionally identical to push, you simply invoke push to do the work for you.
     2. In all other cases, you simply create a new node after the tail node. Force unwrapping is guaranteed to succeed since you push in the isEmpty case with the above guard statement.
     */
    // A.K.A "head-first insertion
    // Complexity: O(1)
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        
        tail = tail!.next
    }
    
    /*
     1. You create a new reference to head and keep track of the current number of traversals.
     2. Using a while loop, you move the reference down the list until you’ve reached the desired index. Empty lists or out-of-bounds indexes will result in a nil return value.
     */
    // Complexity: O(n)
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    /*
     1. @discardableResult lets callers ignore the return value of this method without the compiler jumping up and down warning you about it.
     2. In the case where this method is called with the tail node, you’ll call the functionally equivalent append method. This will take care of updating tail.
     3. Otherwise, you simply link up the new node with the rest of the list and return the new node.
     */
    // Complexity: O(1)
    //Questions: Why this is O(1) and not O(n), n being the index to insert?
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
          append(value)
          return tail!
        }
        node.next = Node(value: value, next: node.next)
        
        return node.next!
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
