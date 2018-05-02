//: Playground - noun: a place where people can play

import UIKit


// Arrays
var array = [String]()
var array2 = Array<String>()
array.append("nidal")
array.append("john")
array.append("jane")

for i in 0..<array.count {
    let string = array[i]
    print(string)
}

print("------------------")

for string in array {
    print(string)
}

print("------------------")

for (index, string) in array.enumerated() {
    print("Item \(index + 1): \(string)")
}

print("------------------")

// Dictionaries
var dictionary = [String : String]()
var dictionary2 = Dictionary<String, String>()
dictionary["firstName"] = "nidal"
dictionary["lastName"] = "fakhouri"

print("------------------")

// Sets
// there is no shorthand for a Set, you must always specify
// notice the output of set2 doesn not output "Nidal" twice
var set1 = Set<Character>()
var set2: Set = ["nidal", "jane", "john", "nidal"]

print("------------------")

