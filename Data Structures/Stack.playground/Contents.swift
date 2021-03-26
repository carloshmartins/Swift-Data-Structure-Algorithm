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



