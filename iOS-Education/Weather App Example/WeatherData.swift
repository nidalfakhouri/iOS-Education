//
//  WeatherData.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/21/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherData {
    
    /*
    "main": {
        "humidity": 88,
        "temp_min": 290.14999999999998,
        "temp_max": 292.14999999999998,
        "temp": 291.26999999999998,
        "pressure": 1004
    },
    "name": "Shuzenji",
    "id": 1851632,
    "coord": {
        "lon": 139,
        "lat": 35
    },
    "weather": [{
        "main": "Clouds",
        "icon": "04n",
        "description": "overcast clouds",
        "id": 804
    }],
    "clouds": {
        "all": 90
    },
    "dt": 1527112080,
    "base": "stations",
    "sys": {
        "sunset": 1527068819,
        "sunrise": 1527017699,
        "message": 0.0041000000000000003,
        "id": 7618,
        "type": 1,
        "country": "JP"
    },
    "cod": 200,
    "visibility": 11265,
    "wind": {
        "deg": 20,
        "speed": 1.5
    }
    */
    
    public var name: String?
    public var weatherDescription: String?
    public var temperatureInKelvin: Double?
    public var humidity: Double?
    public var sunrise: Date?
    public var sunset: Date?
    
    public init(json: JSON) {
        self.name = json["name"].rawValue as? String
        
        // weather is an array of dictionaries
        // but "json["weather"].first" returns a tupple of type (String, JSON)
        // so by saying "json["weather"].first?.1" we are saying give us the JSON
        // "json["weather"].first?.0" would mean we want the string
        if let weatherJSON = json["weather"].first?.1 {
            self.weatherDescription = weatherJSON["description"].rawValue as? String
        }
        
        self.temperatureInKelvin = json["main"]["temp"].rawValue as? Double
        self.humidity = json["main"]["humidity"].rawValue as? Double
        
        if let sunriseUnixTime = json["sys"]["sunrise"].rawValue as? Double {
            self.sunrise = Date(timeIntervalSince1970: sunriseUnixTime)
        }
        
        if let sunsetUnixTime = json["sys"]["sunset"].rawValue as? Double {
            self.sunset = Date(timeIntervalSince1970: sunsetUnixTime)
        }
    }
    
    // shows the use of an computed property using an guard-let
    public var temperatureInCelsius: Double? {
        guard let temperatureInKelvin = self.temperatureInKelvin else {
            return nil
        }
        
        return temperatureInKelvin - 273.15
    }
    
    // shows the use of an computed property using an if-let
    public var temperatureInFahrenheit: Double? {
        if let temperatureInKelvin = self.temperatureInKelvin {
            return (temperatureInKelvin * (9/5)) - 459.67
        }
        else {
            return nil
        }
    }
    
    public var description: String {
        var description = ""
        description += "name                    : \(String(describing: name))\n"
        description += "weatherDescription      : \(String(describing: weatherDescription))\n"
        description += "temperatureInKelvin     : \(String(describing: temperatureInKelvin))\n"
        description += "temperatureInCelsius    : \(String(describing: temperatureInCelsius))\n"
        description += "temperatureInFahrenheit : \(String(describing: temperatureInFahrenheit))\n"
        description += "humidity                : \(String(describing: humidity))\n"
        description += "sunrise                 : \(String(describing: sunrise))\n"
        description += "sunset                  : \(String(describing: sunrise))\n"
        return description
    }
}
