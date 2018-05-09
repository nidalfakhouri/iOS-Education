
import UIKit

// static vs mutable values
let staticString = "static string"

// Operations with strings
var mutableString = "mutable string"
mutableString += " foo"
mutableString = "\(mutableString) plus another string"

// optional vs non optional
var nonOptionalString = "non optional string"
var optionalString: String? = nil

// other optional types
var optionalStringNil: String! = nil
var optionalStringNotNil: String! = "not a nil string"

// unwrapping optional values
if let string = optionalString {
    mutableString = string
}

// force unwrapping - DO NOT DO THIS!!
let aString: String = optionalStringNotNil!

// non optional / non mutable
let foo1 = "foo"

// non optional / mutable
var foo2 = "foo"

// optional / non mutable
// this is mostly used for classes and stucts
let foo3: String? = "foo"

// optional / mutable
var foo4: String? = "foo"

// ANY type can be optional



// Numbers
let a = Int(10)
let b = 10
type(of: a)
type(of: b)

let c = Double(10)
let d = 10.0
type(of: c)
type(of: d)

// becuase numbers are structs, they can be optional also
var x: Int?
x = 10
print(x)
if let val = x {
    print(val)
}

// numbders as objects, there are use cases for this
// anytime you see "NS" it is a vestige from Objective-C and Steve Job's Company "Next Step"
let number = NSNumber(value: 10)
number.stringValue
number.boolValue
number.doubleValue
