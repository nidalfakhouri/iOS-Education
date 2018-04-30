//: Playground - noun: a place where people can play

import UIKit

// generic enum
enum Cities {
    case providence
    case newYork
    case miami
}

let city: Cities = .providence

// string enum
enum State: String {
    case rhodeIsland
    case newYork
    case florida
}

let state: State = .rhodeIsland
print(state.rawValue)
let otherState = State(rawValue: "newYork")

// enums can be optionals also
var someState: State? = nil
someState = otherState

// int enum
enum Region: Int {
    case northeast
    case southeast
    case midwest
    case south
    case west
    case southwest
    case northwest
}

let region: Region = .midwest
print(region.rawValue)
let otherRegion = Region(rawValue: 6)
