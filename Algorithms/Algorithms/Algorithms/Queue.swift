//
//  Queue.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/12/21.
//

import Foundation

class QueueNode<T: Comparable> {
    
    var next: QueueNode? = nil
    var data: T
    
    init(data: T) {
        self.data = data
    }
}

class Queue {
    
    var first: QueueNode<Int>? = nil
    var last: QueueNode<Int>? = nil
    
    var isEmpty: Bool {
        return first == nil
    }
    
    func add(value: Int) {
        let newQueueNode = QueueNode(data: value)
        if last != nil {
            last?.next = newQueueNode
        }
        
        last = newQueueNode
        
        if first == nil {
            first = last
        }
    }
    
    func remove() -> Int? {
        guard isEmpty == false else {
            return nil
        }
        
        let firstData = first?.data
        
        first = first?.next
        
        if first == nil {
            last = nil
        }
        
        return firstData
    }
    
    func peek() -> Int? {
        guard isEmpty == false else {
            return nil
        }
        
        return first?.data
    }
    
    func printQueue() {
        
        var queueString = ""
        
        var currentNode = first
        
        while currentNode != nil {
            if let data = currentNode?.data {
                queueString = queueString + "\(data)->"
            }
            currentNode = currentNode?.next
        }
        
        queueString = queueString + "nil"
        
        print(queueString)
        print("******************\n")
    }
}

class QueueUsingTwoStacks {
    
    var stackNewest = Stack()
    var stackOldest = Stack()
    
    public var size: Int {
        return stackNewest.size + stackOldest.size
    }
    
    func addValue(value: Int) {
        stackNewest.push(newValue: value)
    }
    
    func shiftStacks() {
        if stackOldest.isEmpty == true {
            while stackNewest.isEmpty == false {
                if let pop = stackNewest.pop() {
                    stackOldest.push(newValue: pop)
                }
            }
        }
    }
    
    func peek() -> Int? {
        shiftStacks()
        return stackOldest.peek()
    }
    
    func remove() -> Int? {
        shiftStacks()
        return stackOldest.pop()
    }
    
    func printQueueUsingTwoStacks() {
        print("stackNewest:")
        stackNewest.printStack()
        print("stackOldest:")
        stackOldest.printStack()
    }
}

struct QueueTest {
    
    static func QueueTest() {
        test1()
    }
    
    static func test1() {
        let queue = Queue()
        queue.add(value: 10)
        queue.add(value: 20)
        queue.add(value: 30)
        
        
        /*
        queue.printQueue()
        
        queue.add(value: 30)
        queue.printQueue()
        _ = queue.remove()
        queue.printQueue()
         */
    }
    
    static func test2() {
        let twoStacks = QueueUsingTwoStacks()
        twoStacks.addValue(value: 1)
        twoStacks.addValue(value: 2)
        twoStacks.addValue(value: 3)
        print("twoStacks.remove(): \(String(describing: twoStacks.remove()))")
        print("twoStacks.remove(): \(String(describing: twoStacks.remove()))")
        print("twoStacks.remove(): \(String(describing: twoStacks.remove()))")
        twoStacks.addValue(value: 4)
        twoStacks.addValue(value: 5)
        twoStacks.addValue(value: 6)
        print("twoStacks.remove(): \(String(describing: twoStacks.remove()))")
        twoStacks.addValue(value: 7)
        twoStacks.addValue(value: 8)
        print("twoStacks.remove(): \(String(describing: twoStacks.remove()))")
        twoStacks.addValue(value: 9)
        print("twoStacks.remove(): \(String(describing: twoStacks.remove()))")
        twoStacks.printQueueUsingTwoStacks()
    }
}
