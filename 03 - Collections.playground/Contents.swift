
import UIKit


// Arrays
var array = [String]()
var array2 = Array<String>()
array.append("nidal")
array.append("john")
array.append("jane")

// arrays can also be initalized like this, called an array literal
array3 = ["nidal", "john", "jane"]

print("------------------")
// Loop option 1
for i in 0..<array.count {
    let string = array[i]
    print(string)
}

print("------------------")
// Loop option 2
for i in 0...array.count - 1 {
    let string = array[i]
    print(string)
}

print("------------------")
// Loop option 3 - my most favorite one to use if possible
for string in array {
    print(string)
}

print("------------------")
// Loop option 4
for (index, string) in array.enumerated() {
    print("Item \(index + 1): \(string)")
}

print("------------------")

// Loop option 5
// we will talk more about this in closures
array.forEach { print($0) }

print("------------------")

// arrays can be optional also and have optional types!
var optionalArray: [String?]? = nil
optionalArray = [String?]()

let string1: String? = nil
let string2 = "nidal"
let string3: String? = "foo bar"
optionalArray?.append(string1)
optionalArray?.append(string2)
optionalArray?.append(string3)
print(optionalArray)

if let nonOptionalArray = optionalArray {
    for optionalString in nonOptionalArray {
        if let nonOptionalString = optionalString {
            print(nonOptionalString)
        }
    }
}

print("------------------")

// Dictionaries
var dictionary = [String : String]()
var dictionary2 = Dictionary<String, String>()
dictionary["firstName"] = "nidal"
dictionary["lastName"] = "fakhouri"

// this is a dictionary literal
var dictionary3 = ["firstName" : "nidal", "lastName" : "fakhouri"]

print("------------------")

// Sets
// there is no shorthand for a Set, you must always specify
// notice the output of set2 doesn not output "Nidal" twice
var set1 = Set<Character>()
var set2: Set = ["nidal", "jane", "john", "nidal"]

print("------------------")

