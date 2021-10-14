//
//  Lonelyinteger.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/13/21.
//

import Foundation

struct Lonelyinteger {
    
    static func Lonelyinteger() {
        let a = [1, 2, 3, 4, 3, 2, 1]
        print(lonelyInteger(a))
    }
    
    static func lonelyInteger(_ a: [Int]) -> Int {
        
        var integerSet = Set<Int>()
        
        for value in a {
            if integerSet.contains(value) == false {
                integerSet.insert(value)
            }
            else {
                integerSet.remove(value)
            }
        }
        
        return integerSet.removeFirst()
    }
}
