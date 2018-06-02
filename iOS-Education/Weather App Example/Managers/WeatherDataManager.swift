//
//  WeatherDataManager.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/14/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherDataManager {
    
    /// the shared instance singleton object
    static let shared = WeatherDataManager()
    
    /// Get your own! https://openweathermap.org/appid#use*
    let APPID = "26702f89005804f905856412e6cec319"
    
    /// get a single weather data object for a location
    func getWeatherFor(coordinate: CLLocationCoordinate2D, completion: @escaping (WeatherData?)->()) {
        
        let urlString = "http://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&APPID=\(WeatherDataManager.shared.APPID)"
        
        Alamofire.request(urlString).responseJSON { (responseData) -> Void in
            if let data = responseData.result.value {
                let weatherJSON = JSON(data)
                let weather = WeatherData(json: weatherJSON)
                completion(weather)
            }
            else {
                completion(nil)
            }
        }
    }
    
    /// get 5 days of weather forecasts in 3 hour increments, returns about 40 entries
    func get5DayWeatherForecastFor(coordinate: CLLocationCoordinate2D, completion: @escaping ([WeatherData]?)->()) {
        
        let urlString = "http://api.openweathermap.org/data/2.5/forecast?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&APPID=\(WeatherDataManager.shared.APPID)"
        
        Alamofire.request(urlString).responseJSON { (responseData) -> Void in
            if let data = responseData.result.value {
                let forecatJSON = JSON(data)
                let name = forecatJSON["city"]["name"].rawValue as? String
                
                let forecasts = forecatJSON["list"]
                var forecastsArray = [WeatherData]()
                for json in forecasts {
                    let weather = WeatherData(name: name, json: json.1)
                    forecastsArray.append(weather)
                }
                
                completion(forecastsArray)
            }
            else {
                completion(nil)
            }
        }
    }
}
