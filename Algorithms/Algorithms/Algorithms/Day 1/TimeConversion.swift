//
//  TimeConversion.swift
//  Algorithms
//
//  Created by Nidal Fakhouri on 10/9/21.
//

import Foundation

struct TimeConversion {
    
    static func TimeConversion() {
        print(timeConversion(s: "07:05:45PM"))
    }
    
    static func timeConversion(s: String) -> String {
        // Write your code here
        
        var timeString24Hour = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ssa"
        if let date = dateFormatter.date(from: s) {
            dateFormatter.dateFormat = "HH:mm:ss"
            timeString24Hour = dateFormatter.string(from: date)
        }
        
        return timeString24Hour
    }
}
