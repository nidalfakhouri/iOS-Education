//
//  Stack.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/12/21.
//

import Foundation

class StackNode<T: Comparable> {
    
    var next: StackNode? = nil
    var data: T
    
    init(data: T) {
        self.data = data
    }
}

class Stack {
    
    var top: StackNode<Int>? = nil
    var size = 0
    
    var isEmpty: Bool {
        return top == nil
    }
    
    func pop() -> Int? {
        guard isEmpty == false else {
            return nil
        }
        
        let topData = top?.data
        top = top?.next
        
        size -= 1
        
        return topData
    }
    
    func push(newValue: Int) {
        let newTop = StackNode(data: newValue)
        newTop.next = top
        top = newTop
        
        size += 1
    }
    
    func peek() -> Int? {
        guard isEmpty == false else {
            return nil
        }
        
        return top?.data
    }
    
    func printStack() {
        
        var current = top
        
        while current != nil {
            if let data = current?.data {
                print("\(data)\n")
                current = current?.next
            }
        }
        print("******************")
    }
}

struct StackTest {
    
    static func StackTest() {
        sortStack()
    }
    
    static func sortStack() {
        
        let stack = Stack()
        stack.push(newValue: 30)
        stack.push(newValue: 25)
        stack.push(newValue: 35)
        stack.printStack()
        
        let helperStack = Stack()
        
        while stack.isEmpty == false {
            
            // insert each element in stack in sorted order into helperStack
            if let temp = stack.pop() {
                
                while helperStack.isEmpty == false && helperStack.peek()! > temp {
                    
                    if let pop = helperStack.pop() {
                        stack.push(newValue: pop)
                    }
                }
                
                helperStack.push(newValue: temp)
            }
        }
        
        while helperStack.isEmpty == false {
            if let pop = helperStack.pop() {
                stack.push(newValue: pop)
            }
        }
        
        stack.printStack()
    }
}
