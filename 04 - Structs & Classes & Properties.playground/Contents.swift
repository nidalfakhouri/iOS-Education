
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
// reasons for doing this?
// 1. you can write code that is used in objective c
// 2. conforming to a protocol that subclasses the NSObjectProtocol
class Account: NSObject {
    
}


















// extensions! in objective c it used to be catagories, its a way to add functionality to a class without subclassing
// all swift data types can have extensions, extensions are availible to all instances of the type
// we can have extensions from user defined types
// usually an extension will add some functionality that combines exsisting data or functionality from the extended class

extension Person {
    var fullName: String {
        // notice here we are refrering to self, you dont need "self." here but I left for the sake of understanding the context
        return "\(self.firstName) \(self.lastName)"
    }
    
    // extensions can also add initalizers!
    // init? means it might return nil, its called a filable initalizer
    convenience init?(fullName: String) {
        let stringParts = fullName.components(separatedBy: " ")
        if stringParts.count == 2 {
            self.init(firstName: stringParts[0], lastName: stringParts[1])
        }
        else {
            return nil
        }
    }
}

// now our "nidal" instance of Person can use this var
nidal.fullName

// john is now an optinoal because it was initalized via a failable initalizer
let john = Person(fullName: "john doe")
john.self
john?.firstName

// Equatable protocol implementation in an extension
// here is an example of using extensions to confrom to protocols
// extensions are nice ways to group functionality for a type
extension Person: Equatable {
    public static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == lhs.lastName
    }
}

nidal == otherNidal

// we can also have extensions from system defined types!
extension String {
    public func trimWhiteSpace() -> String {
        return trimmingCharacters(in: CharacterSet.whitespaces)
    }
}

// notice how the user defined extension has a differnt color in the editor to indicate it is user defined
let string = "foo bar foo bar foo bar"
string.trimWhiteSpace()












