//
//  BinarySearchTree+DistanceBetweenNodes.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/14/21.
//

import Foundation

// Find distance between given pairs of nodes in a binary tree
extension BinarySearchTree {
    
    // Helper function to check if a given node is present in a binary tree or not
    static func isNodePresent(root: BinaryTreeNode<Int>?, node: BinaryTreeNode<Int>?) -> Bool {
        
        // base case
        if root == nil {
            return false
        }
 
        // if the node is found, return true
        if let root = root, let node = node, root == node {
            return true
        }
 
        // return true if the node is found in the left or right subtree
        return isNodePresent(root: root?.left, node: node) || isNodePresent(root: root?.right, node: node)
    }
    
    static func findLevel(root: BinaryTreeNode<Int>?, node: BinaryTreeNode<Int>?, level: Int) -> Int {
        
        // base case
        if root == nil {
            return Int.min
        }
 
        // return level if the node is found
        if let root = root, let node = node, root == node {
            return level
        }

        // search node in the left subtree
        let left = findLevel(root: root?.left, node: node, level: level + 1)
 
        // if the node is found in the left subtree, return the left child
        if (left != Int.min) {
            return left
        }
 
        // otherwise, continue the search in the right subtree
        return findLevel(root: root?.right, node: node, level: level + 1)
    }
    
    // Function to find the lowest common ancestor of given nodes `x` and `y`,
    // where both `x` and `y` are present in the binary tree.
    static func findLCA(root: BinaryTreeNode<Int>?, x: BinaryTreeNode<Int>?, y: BinaryTreeNode<Int>?) -> BinaryTreeNode<Int>? {
        // base case 1: if the tree is empty
        if root == nil {
            return nil
        }
 
        if let root = root, let x = x, let y = y {
            // base case 2: if either `x` or `y` is found
            if root == x || root == y {
                return root
            }
        }
        
        // recursively check if `x` or `y` exists in the left subtree
        let left = findLCA(root: root?.left, x: x, y: y)
 
        // recursively check if `x` or `y` exists in the right subtree
        let right = findLCA(root: root?.right, x: x, y: y)
 
        // if `x` is found in one subtree and `y` is found in the other subtree,
        // update lca to the current node
        if left != nil && right != nil {
            return root;
        }
 
        // if `x` and `y` exist in the left subtree
        if left != nil {
            return left
        }
 
        // if `x` and `y` exist in the right subtree
        if right != nil {
            return right
        }
 
        return nil
    }
    
    // Function to find the distance between node `x` and node `y` in a
    // given binary tree rooted at `root` node
    static func findDistance(root: BinaryTreeNode<Int>?, x: BinaryTreeNode<Int>?, y: BinaryTreeNode<Int>?) -> Int
    {
        // `lca` stores the lowest common ancestor of `x` and `y`
        var lca: BinaryTreeNode<Int>? = nil
 
        // call LCA procedure only if both `x` and `y` are present in the tree
        if isNodePresent(root: root, node: y) && isNodePresent(root: root, node: x) {
            lca = findLCA(root: root, x: x, y: y)
        }
        else {
            return 0
        }
 
        // return distance of `x` from lca + distance of `y` from lca
        return findLevel(root: lca, node: x, level: 0) + findLevel(root: lca, node: y, level: 0);
 
        /*
            The above statement is equivalent to the following:
 
            return findLevel(root, x, 0) + findLevel(root, y, 0) -
                    2*findLevel(root, lca, 0);
 
            We can avoid calling the `isNodePresent()` function by using
            return values of the `findLevel()` function to check if
            `x` and `y` are present in the tree or not.
        */
    }
}
