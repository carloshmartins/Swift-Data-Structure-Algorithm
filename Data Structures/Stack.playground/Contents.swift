import Foundation

var stack = Stack<Int>()

stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)

print(stack)


if let poppedElement = stack.pop() {
  assert(4 == poppedElement)
  print("Popped: \(poppedElement)")
}

