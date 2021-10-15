//
//  BinarySearchTree.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/9/21.
//

import Foundation

/*
 Implementation Start:
 https://dennis-xlc.gitbooks.io/swift-algorithms-data-structures/content/chapter6.html
 
 Algorithim Help:
 https://appliedgo.net/balancedtree/
 https://medium.com/techie-delight/binary-tree-interview-questions-and-practice-problems-439df7e5ea1f
 */

//generic binary search tree
class BinaryTreeNode<T: Comparable> {
    
    var value: T?
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(value: T?) {
        self.value = value
    }
    
    //add item based on its value
    func addNode(newValue: T?) {
        
        guard let newValue = newValue else {
            return
        }
        
        //check for the head node
        guard let value = self.value else {
            value = newValue
            return
        }
        
        //check the left side of the tree
        if (newValue < value) {
            if let left = self.left {
                left.addNode(newValue: newValue)
            }
            else {
                left = BinaryTreeNode(value: newValue)
            }
        }
        
        //check the right side of the tree
        if (newValue > value) {
            if let right = self.right {
                right.addNode(newValue: newValue)
            }
            else {
                right = BinaryTreeNode(value: newValue)
            }
        }
        
        balanceTree()
    }
    
    func getNodeHeight(_ node: BinaryTreeNode?) -> Int {
        if let node = node {
            return max(getNodeHeight(node.left), getNodeHeight(node.right)) + 1
        }
        else {
            return -1
        }
    }
    
    func balanceTree() {
        if isLeftHeavy == true {
            rotateRight()
        }
        else if isRightHeavy == true {
            rotateLeft()
        }
    }
    
    func isBalanced() -> Bool {
        return isLeftHeavy == false || isRightHeavy == false
    }
    
    var isLeftHeavy: Bool {
        let leftHeight = getNodeHeight(left)
        let rightHeight = getNodeHeight(right)
        let isLeftHeavy = (leftHeight - rightHeight) > 1
        return isLeftHeavy
    }
    
    var isRightHeavy: Bool {
        let leftHeight = getNodeHeight(left)
        let rightHeight = getNodeHeight(right)
        let isRightHeavy = (rightHeight - leftHeight) > 1
        return isRightHeavy
    }
    
    func isLeafNode() -> Bool {
        return left == nil && right == nil
    }
}

extension BinaryTreeNode where T: Equatable {
    static func ==(lhs: BinaryTreeNode, rhs: BinaryTreeNode) -> Bool {
        return lhs === rhs
    }
}


// Rotation
extension BinaryTreeNode {
    
    func rotateLeft() {
        
        guard let rightValue = right?.value else {
            return
        }
        
        let originalValue = value
        
        //reset the root node
        value = rightValue
        
        if let left = self.left, let originalValue = originalValue {
            left.addNode(newValue: originalValue)
        }
        else {
            left = BinaryTreeNode(value: originalValue)
        }
        
        let rightLeft = right?.left
        
        right = right?.right
        right?.left = rightLeft
    }
    
    func rotateRight() {

        guard let leftValue = left?.value else {
            return
        }
        
        let originalValue = value
        
        //reset the root node
        value = leftValue
        
        if let right = self.right, let originalValue = originalValue {
            right.addNode(newValue: originalValue)
        }
        else {
            right = BinaryTreeNode(value: originalValue)
        }
        
        let leftRight = left?.right
        
        //adjust the left node
        left = left?.left
        left?.right = leftRight
    }
}


// Traversal
extension BinaryTreeNode {
    
    func inOrderTraversal() {
        
        if let left = self.left {
            left.inOrderTraversal()
        }

        printNode()

        if let right = self.right {
            right.inOrderTraversal()
        }
    }
    
    func preOrderTraversal() {

        printNode()
        
        //process the left side
        if let left = self.left {
            left.preOrderTraversal()
        }

        //process the right side
        if let right = self.right {
            right.preOrderTraversal()
        }
    }
    
    func postOrderTraversal() {

        //process the left side
        if let left = self.left {
            left.postOrderTraversal()
        }

        //process the right side
        if let right = self.right {
            right.postOrderTraversal()
        }
        
        printNode()
    }
    
    func printNode() {
        
        var nodeString = ""
        
        if let value = self.value {
            nodeString += "\(value) - height: \(getNodeHeight(self))\n"
        }
        else {
            nodeString += "no value - height: \(getNodeHeight(self))\n"
        }
        
        if let leftValue = self.left?.value {
            nodeString += "\(leftValue)|"
        }
        else {
            nodeString += "-|"
        }
        
        if let rightValue = self.right?.value {
            nodeString += "\(rightValue)\n"
        }
        else {
            nodeString += "-\n"
        }
        
        nodeString += "--------"
        
        print(nodeString)
    }
    
    static func printRootToLeafPaths(node: BinaryTreeNode?, pathString: String) {
        
        guard let node = node else {
            return
        }
        
        if let value = node.value {
            
            var newPath = ""
            
            if pathString.isEmpty == true {
                newPath = "\(value)"
            }
            else {
                newPath = "\(pathString)->\(value)"
            }
            
            if node.isLeafNode() == true {
                print(newPath)
            }
            else {
                printRootToLeafPaths(node: node.left, pathString: newPath)
                printRootToLeafPaths(node: node.right, pathString: newPath)
            }
        }
    }
}

// Test Class
struct BinarySearchTree {
    
    static func BinarySearchTree() {
        //a simple array of unsorted integers
        //let numberList : Array<Int> = [8, 2, 10, 9, 11, 1, 7, 99]
        //let numberList : Array<Int> = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
        //let numberList = [1,2,3,4,5,6]
        //let numberList = [6,5,4,3,2,1]
        /*
        //sort each item in the list
        for number in numberList {
            root.addNode(newValue: number)
        }
        */
        
        let startIndex = 1
        let endIndex = 10
        
        let root = BinaryTreeNode<Int>(value: nil)
        for index in startIndex...endIndex {
            root.addNode(newValue: index)
        }

        //root.preOrderTraversal()
        //print("root.isBalanced(root): \(root.isBalanced())")
        print("numberOfNodesInTree(node: root): \(numberOfNodesInTree(node: root))")
        print("Has all nodes in tree: \(numberOfNodesInTree(node: root) == (endIndex - startIndex))")
    
        //BinaryTreeNode.printRootToLeafPaths(node: root, pathString: "")
        //print("findDistance: \(findDistance(root: root, x: root.left, y: root.right))")
    }
    
    static func valueExsisitsInTree(node: BinaryTreeNode<Int>?, value: Int) -> Bool {
        
        guard let node = node else {
            return false
        }
        
        if let nodeValue = node.value, nodeValue == value {
            return true
        }
        else {
            return valueExsisitsInTree(node: node.left, value: value) || valueExsisitsInTree(node: node.right, value: value)
        }
    }
    
    static func numberOfNodesInTree(node: BinaryTreeNode<Int>?) -> Int {
        
        guard let node = node, node.value != nil else {
            return 0
        }
        
        return numberOfNodesInTree(node: node.left) + numberOfNodesInTree(node: node.right) + 1
    }
}
