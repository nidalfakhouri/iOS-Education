//: Playground - noun: a place where people can play

import UIKit

protocol Informable {
    
    var string: String? { get set }
    
    var number: Int { get set }
    
    func generateString() -> String
}

extension Informable {
    
    func generateString() -> String {
        return "\(string) + \(number)"
    }
}

struct SomeStruct: Informable {
    
    var string: String?
    
    var number: Int
    
    func generateString() -> String {
        return "some other string \(number)"
    }
}

let someStruct = SomeStruct(string: "some string", number: 99)
someStruct.generateString()
