//
//  SortingAndSearching.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/13/21.
//

import Foundation

struct SortingAndSearching {

    static func SortingAndSearching() {
        //binarySearch()
    }
}

// merge sort
extension SortingAndSearching {
    
    static func mergeSort() {
        var array = [1, 99, 45, 33, 12, 8, 5, 16, 18, 22, 28, 44, 64]
        mergeSort(array: &array)
        print(array)
    }
    
    static func mergeSort(array: inout [Int]) {
        var helper = Array<Int>(array)
        mergeSort(array: &array, helper: &helper, low: 0, high: array.count - 1)
    }
    
    static func mergeSort(array: inout [Int], helper: inout [Int], low: Int, high: Int) {
        if low < high {
            let middle = low + (high - low) / 2
            mergeSort(array: &array, helper: &helper, low: low, high: middle)
            mergeSort(array: &array, helper: &helper, low: middle + 1, high: high)
            merge(array: &array, helper: &helper, low: low, middle: middle, high: high)
        }
    }
    
    static func merge(array: inout [Int], helper: inout [Int], low: Int, middle: Int, high: Int) {
        
        print("array: \(array)")
        print("helper: \(helper)")
        print("*******************")
        
        for index in low...high {
            helper[index] = array[index]
        }
        
        var helperLeft = low
        var helperRight = middle + 1
        var current = low
        
        while (helperLeft <= middle && helperRight <= high) {
            if helper[helperLeft] <= helper[helperRight] {
                array[current] = helper[helperLeft]
                helperLeft = helperLeft + 1
            }
            else {
                array[current] = helper[helperRight]
                helperRight = helperRight + 1
            }
            current = current + 1
        }
        
        let remaining = middle - helperLeft
        for index in 0...remaining {
            array[current + index] = helper[helperLeft + index]
        }
    }
}

// binarySearch
extension SortingAndSearching {
    
    static func binarySearch() {
        let array = [1, 99, 45, 33, 12, 8, 5, 16, 18, 22, 28, 44, 64].sorted()
        let foundValue = binarySearch(array: array, x: 12)
        let foundValue2 = binarySearchRecursive(array: array, x: 12, low: 0, high: array.count - 1)
        print("foundValue: \(array[foundValue])")
        print("foundValue2: \(array[foundValue2])")
    }
    
    static func binarySearch(array: [Int], x: Int) -> Int {
        
        var low = 0
        var high = array.count - 1
        var mid = 0
        
        while low <= high {
            mid = low + (high - low) / 2
            if array[mid] < x {
                low = mid + 1
            }
            else if array[mid] > x {
                high = mid - 1
            }
            else {
                return mid
            }
        }
        
        return -1
    }
    
    static func binarySearchRecursive(array: [Int], x: Int, low: Int, high: Int) -> Int {
        
        guard low <= high else {
            return -1
        }
        
        let mid = low + ((high - low) / 2)
        if array[mid] < x {
            return binarySearchRecursive(array: array, x: x, low: mid + 1, high: high)
        }
        else if array[mid] > x {
            return binarySearchRecursive(array: array, x: x, low: low, high: mid - 1)
        }
        else {
            return mid
        }
    }
}

extension SortingAndSearching {
    
}
