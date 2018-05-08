
import UIKit

// no paramters, no return type
func foo() {
    
}

foo()


// no paramters, with return type
func fooWithString() -> String {
    return "foo"
}

let string = fooWithString()


// function with parameter and return type
func addToString(stringToAdd: String) -> String {
    return "foo \(stringToAdd)"
}

addToString(stringToAdd: "bar")


// function with optional parameter and return type
func addToStringWithOptionalParameter(stringToAdd: String?) -> String {
    
    if let string = stringToAdd {
        return "foo \(string)"
    }
    
    return "tried to pass nil"
}

addToStringWithOptionalParameter(stringToAdd: nil)
addToStringWithOptionalParameter(stringToAdd: "bar")


// function that can potentially return nil
func addToStringWithOptionalAndOptionalReturnType(stringToAdd: String?) -> String? {
    
    guard let string = stringToAdd else {
        return nil
    }
    
    // "string" is now availbile in the general scope
    return "foo \(string)"
}

addToStringWithOptionalAndOptionalReturnType(stringToAdd: nil)
addToStringWithOptionalAndOptionalReturnType(stringToAdd: "bar")
if let string = addToStringWithOptionalAndOptionalReturnType(stringToAdd: "bar") {
    print(string)
}

// default values for parameters
func describePerson(firstName: String, lastName: String = "Doe", age: Int? = nil) {
    
    var personString = firstName + " " + lastName
    
    if let age = age {
        personString = "\(personString) \(age)"
    }
    
    print(personString)
}

// you dont have to add values for default parameters
describePerson(firstName: "nidal")
describePerson(firstName: "nidal", lastName:"fakhouri")
describePerson(firstName: "nidal", age: 40)
describePerson(firstName: "nidal", lastName:"fakhouri", age: 35)

