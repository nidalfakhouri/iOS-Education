//
//  WeatherDataManager.swift
//  AnnieCannonsApp
//
//  Created by Nidal Fakhouri on 4/21/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherDataManager {
    
    static let shared = WeatherDataManager()

    static let APPID = "26702f89005804f905856412e6cec319"

    func getWeatherData(completion: @escaping (CurrentWeatherData?)->()) {
        
        // 2
        let urlString = "http://api.openweathermap.org/data/2.5/weather?lat=41.8240&lon=-71.4128&APPID=\(WeatherDataManager.APPID)"
        
        // 3
        AF.request(urlString).responseJSON { (response) in
            
            // 4
            let error = response.error
            
            if let data = response.data, error == nil {
                
                // 5
                let weatherDatajson = JSON(data)
                let weatherData = CurrentWeatherData(weatherJSON: weatherDatajson)
                
                // 7
                completion(weatherData)
            }
            else {
                completion(nil)
            }
        }
    }
}

/*
func returnWeatherData(currentWeatherData: CurrentWeatherData) {
    
}
*/
