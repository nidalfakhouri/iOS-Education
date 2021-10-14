//
//  DiagonalDifference.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/13/21.
//

import Foundation

struct DiagonalDifference {
    
    static func DiagonalDifference() {
        let arr = [[1,2,3], [4,5,6], [9,8,9]]
        print(diagonalDifference(arr))
    }
    
    static func diagonalDifference(_ arr: [[Int]]) -> Int {
        
        var leftToRightDiagonalSum = 0
        var rightToLeftDiagonalSum = 0
        
        let count = arr.count
        
        for index in 0..<count {
            
            let a = arr[index][index]
            leftToRightDiagonalSum = leftToRightDiagonalSum + a
            
            let rightToLeftIndex = (arr.count - 1) - index
            let b = arr[index][rightToLeftIndex]
            rightToLeftDiagonalSum = rightToLeftDiagonalSum + b
        }
        
        return abs(leftToRightDiagonalSum - rightToLeftDiagonalSum)
    }
}
