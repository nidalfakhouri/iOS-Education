//
//  Arrays.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/13/21.
//

import Foundation

struct Arrays {
    
    static func Arrays() {
        //print(checkPalendromePermutation(input: "Tact Coa"))
        //print(checkPermutation(string1: "asd ghy", string2: "gsadhy"))
        //print(isUnique(string: "abcdefg"))
    }
    
    static func isUnique(string: String) -> Bool {
        
        var isUnique = true
        
        var set = Set<Character>()
        for c in string {
            if set.contains(c) == false {
                set.insert(c)
            }
            else {
                isUnique = false
                break
            }
        }
        
        return isUnique
    }
    
    static func checkPermutation(string1: String, string2: String) -> Bool {
        let string1Sorted = string1.trimmedLowercaseString.sorted()
        let string2Sorted = string2.trimmedLowercaseString.sorted()
        return string1Sorted == string2Sorted
    }
    
    static func checkPalendromePermutation(input: String) -> Bool {
        
        let trimmedString = input.trimmedLowercaseString
        
        var dict = [Character : Int]()
        
        for c in trimmedString {
            if var charCount = dict[c] {
                charCount = charCount + 1
                dict[c] = charCount
            }
            else {
                dict[c] = 1
            }
        }
        
        var numberOfCharactersWithOddValues = 0
        
        for value in dict.values {
            if value % 2 == 1 {
                numberOfCharactersWithOddValues += 1
            }
        }
        
        return numberOfCharactersWithOddValues == 0 || numberOfCharactersWithOddValues == 1
    }
}

extension String {
    
    var trimmedLowercaseString: String {
        return trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "").lowercased()
    }
    
}
