//
//  MiniMaxSum.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/9/21.
//

import Foundation

struct MiniMaxSum {
    
    static func MiniMaxSum() {
        miniMaxSum(arr: [5, 1, 3, 4, 2])
    }
    
    static func miniMaxSum(arr: [Int]) -> Void {
        // Write your code here
        let sortedArray = arr.sorted()
        
        var minValue = 0
        sortedArray.dropLast().forEach({ minValue = $0 + minValue })
        
        var maxValue = 0
        sortedArray.dropFirst().forEach({ maxValue = $0 + maxValue })
        
        print("\(minValue) \(maxValue)")
    }
}
