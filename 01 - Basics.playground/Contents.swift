//: Playground - noun: a place where people can play

import UIKit

// static vs mutable values
let staticString = "static string"

var mutableString = "mutable string"
mutableString += " foo"

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


// Operations with strings

// Numbers
