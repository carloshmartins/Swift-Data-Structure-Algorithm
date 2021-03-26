import Foundation

/*
 Challenge 1: Reverse an Array
 Create a function that prints the contents of an array in reversed order.

 */

func reverseArray<T>(array: [T]) {
    var nonReverdedStack = Stack<T>()
    var reverdedStack = Stack<T>()
    
    for index in array {
        nonReverdedStack.push(index)
    }
    print(nonReverdedStack.description)
    
    for _ in array {
        reverdedStack.push(nonReverdedStack.pop()!)
    }
    
    print(reverdedStack.description)
}

reverseArray(array: [1,2,3,4,5])

/*
 Challenge 2: Balance the parentheses
 Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced. For example:
 */

// Solution Number 1
func isBalancedString(string: String) -> Bool {
    var stack = Stack<String>()
    var balancedCounter = Int()
    
    string.forEach {
        if $0 == "(" {
            balancedCounter += 1
        } else if $0 == ")" {
            balancedCounter -= 1
        }
    }

    return balancedCounter == 0 ? true : false
}

// Solution Number 2
// Using Stack
func checkParentheses(_ string: String) -> Bool {
  var stack = Stack<Character>()
  for character in string {
    if character == "(" {
      stack.push(character)
    } else if character == ")" {
      if stack.isEmpty {
        return false
} else {
        stack.pop()
      }
} }
  return stack.isEmpty
}

print(isBalancedString(string: "(()()"))


