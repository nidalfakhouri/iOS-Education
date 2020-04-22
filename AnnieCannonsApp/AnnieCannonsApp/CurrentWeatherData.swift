//
//  CurrentWeatherData.swift
//  AnnieCannonsApp
//
//  Created by Nidal Fakhouri on 4/21/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import Foundation
import SwiftyJSON

class CurrentWeatherData {
    
    let temp: Double?
    let country: String?
    
    init(weatherJSON: JSON) {
        print(weatherJSON)
        
        // 6
        let main = weatherJSON["main"]
        self.temp = main["temp_max"].rawValue as? Double
        
        let sys = weatherJSON["sys"]
        self.country = sys["country"].rawValue as? String
    }
}
