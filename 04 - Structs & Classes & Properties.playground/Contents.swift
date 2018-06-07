
import Foundation
import UIKit

/*
 https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-ID82
 
 Classes and structures in Swift have many things in common. Both can:
 
 Define properties to store values
 Define methods to provide functionality
 Define subscripts to provide access to their values using subscript syntax
 Define initializers to set up their initial state
 Be extended to expand their functionality beyond a default implementation
 Conform to protocols to provide standard functionality of a certain kind
 
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Classes have additional capabilities that structures do not:
 
 Inheritance enables one class to inherit the characteristics of another.
 Type casting enables you to check and interpret the type of a class instance at runtime.
 Deinitializers enable an instance of a class to free up any resources it has assigned.
 Reference counting allows more than one reference to a class instance.
 
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 As a general guideline, consider creating a structure when one or more of these conditions apply:
 
 The structure’s primary purpose is to encapsulate a few relatively simple data values.
 It is reasonable to expect that the encapsulated values will be copied rather than referenced when you assign or pass around an instance of that structure.
 Any properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced.
 The structure does not need to inherit properties or behavior from another existing type.
 
 Examples of good candidates for structures include:
 
 The size of a geometric shape, perhaps encapsulating a width property and a height property, both of type Double.
 A way to refer to ranges within a series, perhaps encapsulating a start property and a length property, both of type Int.
 A point in a 3D coordinate system, perhaps encapsulating x, y and z properties, each of type Double.
 */

// Developing iOS 11 Apps with Swift: 3. Swift Programming Language - 1:15:44 (memory management)
// value types vs refrence types: https://developer.apple.com/swift/blog/?id=10

struct Point {
    let x: Double
    let y: Double
}

// automatic initalizer is created for you
let point = Point(x: 10.0, y: 20.0)

// class with no inheritance
public class Person {
    let firstName: String
    let lastName: String
    private let age: Int?
    
    init(firstName: String, lastName: String, age: Int? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

let nidal = Person(firstName: "nidal", lastName: "fakhouri")
let otherNidal = Person(firstName: "nidal", lastName: "fakhouri", age: 35)


// class with inheritance from NSObject
class Account: NSObject {
    
}
