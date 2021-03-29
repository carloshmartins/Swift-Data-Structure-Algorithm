import UIKit

// Test Linked List

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

print(list)

var listAppend = LinkedList<Int>()

listAppend.append(1)
listAppend.append(2)
listAppend.append(3)

print(listAppend)
