
import UIKit

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

// notice how subclassing and conforming to protocols looks the same
struct SomeStruct: Informable {
    
    var string: String?
    
    var number: Int
    
    func generateString() -> String {
        return "some other string \(number)"
    }
}

// if you were to subclass and conform it would look like this:
class SomeObject: NSObject, Informable {
    
    var string: String? = nil
    
    var number: Int = 0
}

let someStruct = SomeStruct(string: "some string", number: 99)
someStruct.generateString()

let someObject = SomeObject()
someObject.generateString()

