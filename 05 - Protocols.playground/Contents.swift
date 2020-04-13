
import UIKit

import UIKit

// equivalant to UITableViewDelegate and UITableViewDataSource
protocol Nameable {
    var name: String? { get set }
    func nameWasPrinted()
}

protocol ActionDelegate {
    func doSomeAction()
}

// equivalant to UITableView
class ObjectWith2Delegates {
    
    // property of type nameable
    var delegate: Nameable? = nil
    var actionDelegate: ActionDelegate? = nil

    func printName() {
        print("the name of the delegate is \(String(describing: delegate?.name))")
        delegate?.nameWasPrinted()
    }
    
    func doTheThing() {
        actionDelegate?.doSomeAction()
    }
}

// equivalant to Your View Controller
class Person: Nameable {
    var name: String? = "Nidal"
    // each would a long list of unique properties
    func nameWasPrinted() {
        print("hey, my delegate told me that it printed my name")
    }
}

class Organization: Nameable {
    var name: String? = "Annie Cannons"
    // each would a long list of unique properties
    func nameWasPrinted() {
        print("hey I dont care my name was printed")
    }
}

extension Organization: ActionDelegate {
    func doSomeAction() {
        print("Donate To Annie Cannons")
    }
}

let person = Person() // person conforms to Nameable
let obj1 = ObjectWith2Delegates()
obj1.delegate = person // delegate is of type Nameable, and person conforms to Nameable
obj1.printName()
obj1.doTheThing()

print("--------------")

let organization = Organization() // Organization conforms to Nameable and ActionDelegate
let obj2 = ObjectWith2Delegates()
obj2.delegate = organization // delegate is of type Nameable, and Organization conforms to Nameable
obj2.actionDelegate = organization // delegate is of type ActionDelegate, and Organization conforms to ActionDelegate
obj2.printName()
obj2.doTheThing()

























protocol Informable {
    
    var string: String? { get set }
    
    var number: Int { get set }
    
    func generateString() -> String
}

// default implementation
extension Informable {
    
    func generateString() -> String {
        
        if let string = self.string {
            return "\(string) + \(number)"
        }
        else {
            return "the string value is nil + \(number)"
        }
    }
}

// just as an example protocols can have inheritance
protocol MoreInformable: Informable {
    var date: Date? { get set }
}

// notice how subclassing and conforming to protocols looks the same
struct SomeStruct: Informable {
    
    var string: String?
    
    var number: Int
    
    func generateString() -> String {
        return "some other string \(number)"
    }
}

// if you were to subclass and conform it would look like this:
class SomeObject: NSObject, MoreInformable {
    
    var date: Date? = Date() // current date
    
    var string: String? = nil
    
    var number: Int = 0
}

let someStruct = SomeStruct(string: "some string", number: 99)
someStruct.generateString()

let someObject = SomeObject()
someObject.generateString()

