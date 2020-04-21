//
//  Person.swift
//  AnnieCannonsApp
//
//  Created by Nidal Fakhouri on 4/13/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import Foundation

public class Person {
    
    let firstName: String
    let lastName: String
    let age: Int?
    
    init(firstName: String, lastName: String, age: Int?) {
        // use self. to be explicit in refering to the class property
        // use self. in an initalizer when create class properties for the first time
        // http://thebugcode.github.io/when-to-self-in-swift-and-when-not-to-2/
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
