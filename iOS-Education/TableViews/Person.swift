//
//  Person.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/16/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import Foundation

public class Person {
    
    let firstName: String
    let lastName: String
    let age: Int
    
    public init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
