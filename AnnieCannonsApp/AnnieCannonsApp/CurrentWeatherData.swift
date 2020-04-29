//
//  CurrentWeatherData.swift
//  AnnieCannonsApp
//
//  Created by Nidal Fakhouri on 4/21/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import Foundation
import SwiftyJSON

/*
 {
   "main" : {
     "sea_level" : 1021,
     "feels_like" : 277.98000000000002,
     "temp_min" : 280.69,
     "temp_max" : 280.75999999999999,
     "pressure" : 1020,
     "grnd_level" : 1020,
     "humidity" : 74,
     "temp_kf" : 0.070000000000000007,
     "temp" : 280.75999999999999
   },
   "clouds" : {
     "all" : 82
   },
   "dt" : 1588118400,
   "sys" : {
     "pod" : "n"
   },
   "wind" : {
     "speed" : 1.8899999999999999,
     "deg" : 176
   },
   "dt_txt" : "2020-04-29 00:00:00",
   "weather" : [
     {
       "description" : "broken clouds",
       "id" : 803,
       "icon" : "04n",
       "main" : "Clouds"
     }
   ]
 }
 */

class CurrentWeatherData {
    
    let temperatureInKelvin: Double?
    let country: String?
    
    init(weatherJSON: JSON) {
        print(weatherJSON)
        
        let main = weatherJSON["main"]
        self.temperatureInKelvin = main["temp_max"].rawValue as? Double
        
        let sys = weatherJSON["sys"]
        self.country = sys["country"].rawValue as? String
    }
    
    // computed property
    public var temperatureInFahrenheit: Double? {
        if let temperatureInKelvin = self.temperatureInKelvin {
            return (temperatureInKelvin * (9/5)) - 459.67
        }
        else {
            return nil
        }
    }
    
    public var tempString: String {
        if let kelvin = temperatureInKelvin, let fahrenheit = temperatureInFahrenheit {
            return "kelvin: \(kelvin) - fahrenheit: \(fahrenheit)"
        }
        else {
            return ""
        }
    }
}
