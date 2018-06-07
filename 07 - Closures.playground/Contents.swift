
import UIKit

// https://docs.swift.org/swift-book/LanguageGuide/Closures.html
// https://code.tutsplus.com/tutorials/swift-from-scratch-closures--cms-23138

// Developing iOS 11 Apps with Swift: 4. More Swift - 1:07:03

// closures are commonly refered to as completion blocks
let completion1: ()->() = {
    print("we called a closure!")
}

// call completion
completion1()

// closure with no parameters and a boolean return value
let completion2: ()->(Bool) = {
    return false
}

// what type is "isTrue"? Bool!
let isTrue = completion2()

// closure with parameters and a return value
let completion3: (Int, Int)->(Bool) = { a, b in
    return a > b
}

// what type is "x"? Bool!
let x = completion3(10, 7)


// giving a closure a type name, no its pretty much a type you can use as any other type
typealias NumberComparisonCompletionBlock = (Int, Int)->(Bool)

let isAGreaterThanB: NumberComparisonCompletionBlock = { a, b in
    return a > b
}

let isALessThanB: NumberComparisonCompletionBlock = { a, b in
    return a < b
}

let isAEqualToB: NumberComparisonCompletionBlock = { a, b in
    return a == b
}

isAGreaterThanB(1, 2)
isAGreaterThanB(2, 1)


// closures can be parameters to functions also
func runNumberComparison(description: String, a: Int, b: Int, completion: NumberComparisonCompletionBlock) {
    print("\(description) - a = \(a), b = \(b): \(completion(a, b))")
}

runNumberComparison(description: "(is A greater than B)", a: 1, b: 3, completion: isAGreaterThanB)
runNumberComparison(description: "(is A greater than B)", a: 3, b: 1, completion: isAGreaterThanB)

runNumberComparison(description: "(is A less than B)", a: 1, b: 3, completion: isALessThanB)
runNumberComparison(description: "(is A less than B)", a: 3, b: 1, completion: isALessThanB)

runNumberComparison(description: "(is A equal to B)", a: 3, b: 1, completion: isAEqualToB)
runNumberComparison(description: "(is A equal to B)", a: 3, b: 3, completion: isAEqualToB)

runNumberComparison(description: "are 2 squares", a: 4, b: 17) { (a, b) -> (Bool) in
    let sqrtA = sqrt(Double(a))
    let sqrtB = sqrt(Double(b))
    return sqrtA.truncatingRemainder(dividingBy: 1.0) == 0.0 && sqrtB.truncatingRemainder(dividingBy: 1.0) == 0.0
}

print("--------------")

// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
// closures with arrays


var numbers = [8, 4, 10, 0, 6, 7, 22, 6, 4, 89, 235, 67, 12, 22]

/*
 definition of forEach looks like:
 public func forEach(_ body: (Element) throws -> Void) rethrows
*/

numbers.forEach { (number) in
    print(number)
}

print("--------------")

numbers.forEach({
    print($0)
})

print("--------------")

let sortedNumbers = numbers.sorted { (a, b) -> Bool in
    return a > b
}

sortedNumbers.forEach {
    print($0)
}

print("--------------")

let otherSortedNumbers = numbers.sorted {
    $0 < $1
}

otherSortedNumbers.forEach {
    print($0)
}

print("--------------")

let stringMappedNumbers = numbers.map {
    return String("number: \($0)")
}

stringMappedNumbers.forEach {
    print($0)
}

print("--------------")

let filteredNumbers = numbers.filter {
    return $0 < 10
}

filteredNumbers.forEach {
    print($0)
}

print("--------------")
