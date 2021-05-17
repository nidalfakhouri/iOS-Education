//
//  CodeSnippets.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/17/21.
//  Copyright © 2021 Nidal Fakhouri. All rights reserved.
//

import Foundation

//-----------------------------------------------------------------
enum SomeError: Error {
    
    case genericError
    
    init() {
        self = .genericError
    }
}


//-----------------------------------------------------------------
struct Point: Equatable, Hashable {
    
    var x: Int
    var y: Int
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
    
    var center: Point {
        get {
            Point(x: x, y: y)
        }
        set {
            x = newValue.x
            y = newValue.y
        }
    }
}


//-----------------------------------------------------------------
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}


//-----------------------------------------------------------------
struct Generic<T> {
    var value: T
}

extension Generic where T: Equatable {
    
    static func ==(lhs: Generic, rhs: Generic) -> Bool {
        return lhs.value == rhs.value
    }
}


//-----------------------------------------------------------------
class CodeSnippets {
    
    func start() {
        do {
            let number = try throwsError(numberString: "22")
            print(number)
        }
        catch {
            print(error)
        }
    }
    
    func throwsError(numberString: String) throws -> Int {
        
        if let number = Int(numberString) {
            return number
        }
        else {
            throw SomeError()
        }
    }
    
    func forLoops() {
        
        //
        let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        for (animalName, legCount) in numberOfLegs {
            print("\(animalName)s have \(legCount) legs")
        }
        
        //
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        //
        let minutes = 60
        for tickMark in 0..<minutes {
            print(tickMark)
        }
    }
    
    func sorting() {
        var users = [
            Generic<String>(value: "Jemima"),
            Generic<String>(value: "Peter"),
            Generic<String>(value: "David"),
            Generic<String>(value: "Kelly"),
            Generic<String>(value: "Isabella")
        ]
        
        users.sort {
            $0.value < $1.value
        }
        
        let _ = users.sorted {
            $0.value < $1.value
        }
    }
    
    func enums(directionToHead: CompassPoint = .south) {
        
        switch directionToHead {
        case .north:
            print("Lots of planets have a north")
        case .south:
            print("Watch out for penguins")
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
        }
        
        var productBarcode = Barcode.upc(8, 85909, 51226, 3)
        productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
        switch productBarcode {
        case .upc(let numberSystem, let manufacturer, let product, let check):
            print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
        case .qrCode(let productCode):
            print("QR code: \(productCode).")
        }
    }
    
    func swapTwoStrings(_ a: inout String, _ b: inout String) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
}



