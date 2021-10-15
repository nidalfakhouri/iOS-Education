//
//  LinkedList.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/12/21.
//

import Foundation

class LinkedListNode<T: Comparable> {
    
    var next: LinkedListNode? = nil
    var last: LinkedListNode? = nil
    var data: T
    
    init(data: T) {
        self.data = data
    }
    
    func appendToTail(newData: T) {

        var currentNode: LinkedListNode? = self
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        last = LinkedListNode(data: newData)
        
        currentNode?.next = last
    }
    
    func contains(data: T) -> Bool {
        
        var doesContain = false
        
        var currentNode: LinkedListNode? = self
        
        while currentNode != nil {
            if let currentData = currentNode?.data, data == currentData {
                doesContain = true
                break
            }
            currentNode = currentNode?.next
        }
        
        return doesContain
    }
    
    func printList() {
        
        var listString = ""
        
        var currentNode: LinkedListNode? = self
        
        while currentNode != nil {
            if let data = currentNode?.data {
                listString = listString + "\(data)->"
            }
            currentNode = currentNode?.next
        }
        
        listString = listString + "nil"
        
        print(listString)
    }
}

struct LinkedList {
    
    static func LinkedList() {
        test2()
    }
    
    static func test1() {
        var root = LinkedListNode<Int>(data: 1)
        root.appendToTail(newData: 4)
        root.appendToTail(newData: 5)
        root.appendToTail(newData: 99)
        let node99 = root.last
        
        root.appendToTail(newData: 4)
        root.appendToTail(newData: 6)
        root.appendToTail(newData: 4)
        root.printList()
    
        _ = deleteNode(node99)
        root.printList()
    
        root = removeDuplicates2(root)
        root.printList()
    }
    
    static func test2() {
        var root: LinkedListNode<Int>? = LinkedListNode<Int>(data: 3)
        root?.appendToTail(newData: 5)
        _ = root?.appendToTail(newData: 8)
        _ = root?.appendToTail(newData: 5)
        _ = root?.appendToTail(newData: 10)
        _ = root?.appendToTail(newData: 2)
        _ = root?.appendToTail(newData: 1)
        root?.printList()
        
        root = partition(root, partitionValue: 5)
        root?.printList()
    }
    
    static func removeDuplicates(_ root: LinkedListNode<Int>) {
    
        let newRoot = LinkedListNode<Int>(data: root.data)
        
        var currentNode: LinkedListNode? = root
        while currentNode != nil {
            
            if let data = currentNode?.data {
                if newRoot.contains(data: data) == false {
                    newRoot.appendToTail(newData: data)
                }
            }
            
            currentNode = currentNode?.next
        }
    }
    
    static func removeDuplicates2(_ root: LinkedListNode<Int>) -> LinkedListNode<Int> {

        let newRoot = LinkedListNode<Int>(data: root.data)
        var currentNode: LinkedListNode? = root.next
        var set = Set<Int>()
        set.insert(root.data)
        
        while currentNode != nil {
            
            if let data = currentNode?.data {
                if set.contains(data) == false {
                    set.insert(data)
                    newRoot.appendToTail(newData: data)
                }
            }
            
            currentNode = currentNode?.next
        }
        
        return newRoot
    }
    
    static func deleteNode(_ node: LinkedListNode<Int>?) -> Bool {
        if let node = node, let next = node.next {
            node.data = next.data
            node.next = next.next
            return true
        }
        else {
            return false
        }
    }
    
    static func partition(_ root: LinkedListNode<Int>?, partitionValue: Int) -> LinkedListNode<Int>? {
        
        var lessThanRoot: LinkedListNode<Int>? = nil
        var greaterThanRoot: LinkedListNode<Int>? = nil
        
        var currentNode: LinkedListNode? = root
        while currentNode != nil {
            
            if let data = currentNode?.data {
                if data >= partitionValue {
                    if greaterThanRoot == nil {
                        greaterThanRoot = LinkedListNode(data: data)
                    }
                    else {
                        _ = greaterThanRoot?.appendToTail(newData: data)
                    }
                }
                else {
                    if lessThanRoot == nil {
                        lessThanRoot = LinkedListNode(data: data)
                    }
                    else {
                        _ = lessThanRoot?.appendToTail(newData: data)
                    }
                }
            }
            
            
            
            currentNode = currentNode?.next
        }
        
        lessThanRoot?.last?.next = greaterThanRoot
        
        return lessThanRoot
    }
}
