
import UIKit

// generic enum, type is always capital first, case is always lowercase first
enum Cities {
    case providence
    case newYork
    case miami
}

// always use .case
let city: Cities = .providence

// use a switch statment with enums to determine state
switch city {
case .providence:
    print("the creative capital")
default: // use default if dont want to trap all cases
    break
}

// enum with all cases
switch city {
case .providence:
    print("the creative capital")
case .newYork:
    print("too expensive")
case .miami:
    print("the best weather")
}

//--------------------------------------------------

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
    
    // enums can have computed proerties
    var isEast: Bool {
        if self == .northeast || self == .southeast {
            return true
        }
        else {
            return false
        }
    }
}

//
let region: Region = .midwest
print(region.rawValue)
let otherRegion = Region(rawValue: 6)


// more complex enums, with associated values
enum LivingSituation {
    case rent(pricePerMonth: Double, roomates: Int)
    case ownWithMortgage(mortgage: Double, maintenance: Double)
    case ownFully(propertyTaxes: Double)
    case livesAtHome
    
    var description: String {
        switch self {
        case .rent(let pricePerMonth, let roomates):
            return "rents at \(pricePerMonth) per month with \(roomates) roomates"
        case .ownWithMortgage(let mortgage, let maintenance):
            return "owns and has a mortgage of \(mortgage) per month and \(maintenance) costs"
        case .ownFully(let propertyTaxes):
            return "owns house fully and pays \(propertyTaxes) annually"
        case .livesAtHome:
            return "lives at home and has no costs"
        }
    }
}

let situationA: LivingSituation = .rent(pricePerMonth: 900.0, roomates: 3)
situationA.description

let situationB: LivingSituation = .ownWithMortgage(mortgage: 1200.0, maintenance: 500.0)
situationB.description

let situationC: LivingSituation = .ownFully(propertyTaxes: 4000.0)
situationC.description

let situationD: LivingSituation = .livesAtHome
situationD.description


