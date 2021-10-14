//
//  File.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/9/21.
//

import Foundation
import CoreGraphics

struct PlusMinus {
    
    static func PlusMinus() {
        plusMinus(arr: [-1, -1, 0, 1, 1])
    }

    static func plusMinus(arr: [Int]) -> Void {
        // Write your code here
        
        var negatives: CGFloat = 0
        var zeros: CGFloat = 0
        var positives: CGFloat = 0
        
        for num in arr {
            
            if num < 0 {
                negatives = negatives + 1
            }
            else if num == 0 {
                zeros = zeros + 1
            }
            else if num > 0 {
                positives = positives + 1
            }
        }
        
        let count = CGFloat(arr.count)
        
        let values = [positives/count, negatives/count, zeros/count]
        for value in values {
            print(String(format:"%0.6f", value))
        }
    }
}
