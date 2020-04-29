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
    
    // singleton
    static let shared = WeatherDataManager()

    static let APPID = "26702f89005804f905856412e6cec319"

    // takes as a paramter a closure that has a paramater of type CurrentWeatherData and returns nothing
    /*
     
     (CurrentWeatherData?)->() is the same as:
     
     func returnWeatherData(currentWeatherData: CurrentWeatherData) {
         
     }
     
     */
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
    
    func get5DayWeatherData(completion: @escaping ([CurrentWeatherData])->()) {
        
        // 2 get5DayWeatherData
        let urlString = "http://api.openweathermap.org/data/2.5/forecast?lat=41.8240&lon=-71.4128&APPID=\(WeatherDataManager.APPID)"
        
        // 3 get5DayWeatherData
        AF.request(urlString).responseJSON { (response) in
            
            let error = response.error
            
            var weatherDataArray = [CurrentWeatherData]()
            
            // 4 get5DayWeatherData
            if let data = response.data, error == nil {
                // 5 get5DayWeatherData
                let fiveDayWeatherDatajson = JSON(data)
                let list = fiveDayWeatherDatajson["list"]
                for weatherJson in list {
                    // weatherJson is of type (String, JSON) which is a tuple, to say weatherJson.0 would give you type String and weatherJson.1 gives type JSON
                    let json = weatherJson.1
                    let weatherData = CurrentWeatherData(weatherJSON: json)
                    weatherDataArray.append(weatherData)
                }
                
                
            }
            
            completion(weatherDataArray)
        }
    }
}

/*
 
 ("0", {
   "dt_txt" : "2020-04-29 00:00:00",
   "weather" : [
     {
       "main" : "Clouds",
       "description" : "broken clouds",
       "id" : 803,
       "icon" : "04n"
     }
   ],
   "dt" : 1588118400,
   "wind" : {
     "speed" : 1.8899999999999999,
     "deg" : 176
   },
   "sys" : {
     "pod" : "n"
   },
   "clouds" : {
     "all" : 82
   },
   "main" : {
     "temp_kf" : 0.070000000000000007,
     "temp" : 280.75999999999999,
     "temp_max" : 280.75999999999999,
     "sea_level" : 1021,
     "temp_min" : 280.69,
     "humidity" : 74,
     "pressure" : 1020,
     "grnd_level" : 1020,
     "feels_like" : 277.98000000000002
   }
 })
 
 
 ------
 
 
 get5DayWeatherData function call fiveDayWeatherDatajson: {
   "list" : [
     {
       "wind" : {
         "deg" : 176,
         "speed" : 1.8899999999999999
       },
       "dt_txt" : "2020-04-29 00:00:00",
       "dt" : 1588118400,
       "sys" : {
         "pod" : "n"
       },
       "main" : {
         "pressure" : 1020,
         "humidity" : 74,
         "temp" : 280.75999999999999,
         "temp_max" : 280.75999999999999,
         "sea_level" : 1021,
         "feels_like" : 277.98000000000002,
         "grnd_level" : 1020,
         "temp_kf" : 0.070000000000000007,
         "temp_min" : 280.69
       },
       "weather" : [
         {
           "id" : 803,
           "icon" : "04n",
           "description" : "broken clouds",
           "main" : "Clouds"
         }
       ],
       "clouds" : {
         "all" : 82
       }
     },
     {
       "clouds" : {
         "all" : 34
       },
       "sys" : {
         "pod" : "n"
       },
       "main" : {
         "temp_min" : 278.02999999999997,
         "humidity" : 85,
         "sea_level" : 1021,
         "temp" : 278.63,
         "feels_like" : 275.85000000000002,
         "grnd_level" : 1021,
         "pressure" : 1021,
         "temp_max" : 278.63,
         "temp_kf" : 0.59999999999999998
       },
       "dt_txt" : "2020-04-29 03:00:00",
       "weather" : [
         {
           "main" : "Clouds",
           "icon" : "03n",
           "id" : 802,
           "description" : "scattered clouds"
         }
       ],
       "dt" : 1588129200,
       "wind" : {
         "deg" : 219,
         "speed" : 1.8700000000000001
       }
     },
     {
       "dt_txt" : "2020-04-29 06:00:00",
       "clouds" : {
         "all" : 16
       },
       "weather" : [
         {
           "description" : "few clouds",
           "id" : 801,
           "main" : "Clouds",
           "icon" : "02n"
         }
       ],
       "sys" : {
         "pod" : "n"
       },
       "dt" : 1588140000,
       "wind" : {
         "deg" : 269,
         "speed" : 1.8600000000000001
       },
       "main" : {
         "grnd_level" : 1022,
         "pressure" : 1023,
         "temp_min" : 277.49000000000001,
         "temp_max" : 277.69999999999999,
         "humidity" : 87,
         "feels_like" : 274.81999999999999,
         "sea_level" : 1023,
         "temp_kf" : 0.20999999999999999,
         "temp" : 277.69999999999999
       }
     },
     {
       "dt" : 1588150800,
       "clouds" : {
         "all" : 40
       },
       "main" : {
         "temp_kf" : 0.029999999999999999,
         "grnd_level" : 1022,
         "pressure" : 1023,
         "feels_like" : 274.42000000000002,
         "temp_min" : 277.05000000000001,
         "sea_level" : 1023,
         "temp" : 277.07999999999998,
         "humidity" : 86,
         "temp_max" : 277.07999999999998
       },
       "sys" : {
         "pod" : "n"
       },
       "dt_txt" : "2020-04-29 09:00:00",
       "weather" : [
         {
           "id" : 802,
           "icon" : "03n",
           "description" : "scattered clouds",
           "main" : "Clouds"
         }
       ],
       "wind" : {
         "speed" : 1.3600000000000001,
         "deg" : 338
       }
     },
     {
       "weather" : [
         {
           "icon" : "03d",
           "id" : 802,
           "main" : "Clouds",
           "description" : "scattered clouds"
         }
       ],
       "dt_txt" : "2020-04-29 12:00:00",
       "wind" : {
         "speed" : 2.3900000000000001,
         "deg" : 54
       },
       "dt" : 1588161600,
       "sys" : {
         "pod" : "d"
       },
       "clouds" : {
         "all" : 31
       },
       "main" : {
         "temp_kf" : 0,
         "feels_like" : 277.24000000000001,
         "temp" : 280.44999999999999,
         "pressure" : 1025,
         "temp_min" : 280.44999999999999,
         "grnd_level" : 1025,
         "humidity" : 73,
         "temp_max" : 280.44999999999999,
         "sea_level" : 1025
       }
     },
     {
       "main" : {
         "temp_min" : 285.87,
         "sea_level" : 1027,
         "grnd_level" : 1026,
         "temp_kf" : 0,
         "feels_like" : 281.31,
         "temp_max" : 285.87,
         "pressure" : 1027,
         "temp" : 285.87,
         "humidity" : 45
       },
       "dt_txt" : "2020-04-29 15:00:00",
       "wind" : {
         "speed" : 3.9199999999999999,
         "deg" : 76
       },
       "weather" : [
         {
           "icon" : "04d",
           "id" : 803,
           "description" : "broken clouds",
           "main" : "Clouds"
         }
       ],
       "clouds" : {
         "all" : 54
       },
       "dt" : 1588172400,
       "sys" : {
         "pod" : "d"
       }
     },
     {
       "main" : {
         "humidity" : 43,
         "sea_level" : 1027,
         "temp_max" : 286.98000000000002,
         "grnd_level" : 1026,
         "feels_like" : 282.42000000000002,
         "temp" : 286.98000000000002,
         "temp_kf" : 0,
         "pressure" : 1027,
         "temp_min" : 286.98000000000002
       },
       "dt_txt" : "2020-04-29 18:00:00",
       "wind" : {
         "speed" : 4,
         "deg" : 104
       },
       "weather" : [
         {
           "main" : "Clouds",
           "description" : "broken clouds",
           "icon" : "04d",
           "id" : 803
         }
       ],
       "clouds" : {
         "all" : 77
       },
       "dt" : 1588183200,
       "sys" : {
         "pod" : "d"
       }
     },
     {
       "main" : {
         "grnd_level" : 1026,
         "pressure" : 1027,
         "sea_level" : 1027,
         "temp" : 284.94,
         "temp_kf" : 0,
         "feels_like" : 280.13,
         "humidity" : 51,
         "temp_min" : 284.94,
         "temp_max" : 284.94
       },
       "dt_txt" : "2020-04-29 21:00:00",
       "wind" : {
         "speed" : 4.4699999999999998,
         "deg" : 128
       },
       "weather" : [
         {
           "description" : "broken clouds",
           "id" : 803,
           "main" : "Clouds",
           "icon" : "04d"
         }
       ],
       "clouds" : {
         "all" : 78
       },
       "dt" : 1588194000,
       "sys" : {
         "pod" : "d"
       }
     },
     {
       "main" : {
         "grnd_level" : 1027,
         "feels_like" : 276.25,
         "pressure" : 1028,
         "sea_level" : 1028,
         "temp_kf" : 0,
         "temp_max" : 280.62,
         "temp" : 280.62,
         "humidity" : 62,
         "temp_min" : 280.62
       },
       "dt_txt" : "2020-04-30 00:00:00",
       "wind" : {
         "speed" : 3.5499999999999998,
         "deg" : 131
       },
       "weather" : [
         {
           "icon" : "04n",
           "id" : 803,
           "description" : "broken clouds",
           "main" : "Clouds"
         }
       ],
       "clouds" : {
         "all" : 82
       },
       "dt" : 1588204800,
       "sys" : {
         "pod" : "n"
       }
     },
     {
       "main" : {
         "grnd_level" : 1027,
         "pressure" : 1028,
         "temp" : 279.44999999999999,
         "temp_min" : 279.44999999999999,
         "feels_like" : 275.14999999999998,
         "humidity" : 72,
         "sea_level" : 1028,
         "temp_max" : 279.44999999999999,
         "temp_kf" : 0
       },
       "dt_txt" : "2020-04-30 03:00:00",
       "wind" : {
         "speed" : 3.6600000000000001,
         "deg" : 126
       },
       "weather" : [
         {
           "id" : 804,
           "description" : "overcast clouds",
           "icon" : "04n",
           "main" : "Clouds"
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588215600,
       "sys" : {
         "pod" : "n"
       }
     },
     {
       "main" : {
         "sea_level" : 1027,
         "pressure" : 1027,
         "humidity" : 78,
         "temp_max" : 279.18000000000001,
         "temp_min" : 279.18000000000001,
         "temp" : 279.18000000000001,
         "temp_kf" : 0,
         "feels_like" : 275.10000000000002,
         "grnd_level" : 1026
       },
       "dt_txt" : "2020-04-30 06:00:00",
       "wind" : {
         "speed" : 3.5499999999999998,
         "deg" : 117
       },
       "weather" : [
         {
           "main" : "Clouds",
           "id" : 804,
           "description" : "overcast clouds",
           "icon" : "04n"
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588226400,
       "sys" : {
         "pod" : "n"
       }
     },
     {
       "main" : {
         "sea_level" : 1026,
         "feels_like" : 275.33999999999997,
         "temp_kf" : 0,
         "humidity" : 80,
         "temp_min" : 279.67000000000002,
         "pressure" : 1026,
         "temp" : 279.67000000000002,
         "grnd_level" : 1025,
         "temp_max" : 279.67000000000002
       },
       "dt_txt" : "2020-04-30 09:00:00",
       "wind" : {
         "speed" : 4.1200000000000001,
         "deg" : 112
       },
       "weather" : [
         {
           "description" : "overcast clouds",
           "main" : "Clouds",
           "id" : 804,
           "icon" : "04n"
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588237200,
       "sys" : {
         "pod" : "n"
       }
     },
     {
       "main" : {
         "grnd_level" : 1025,
         "humidity" : 86,
         "pressure" : 1026,
         "feels_like" : 276.51999999999998,
         "temp_max" : 280.20999999999998,
         "sea_level" : 1026,
         "temp" : 280.20999999999998,
         "temp_min" : 280.20999999999998,
         "temp_kf" : 0
       },
       "dt_txt" : "2020-04-30 12:00:00",
       "wind" : {
         "speed" : 3.6299999999999999,
         "deg" : 131
       },
       "weather" : [
         {
           "icon" : "10d",
           "description" : "light rain",
           "main" : "Rain",
           "id" : 500
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588248000,
       "sys" : {
         "pod" : "d"
       },
       "rain" : {
         "3h" : 0.66000000000000003
       }
     },
     {
       "main" : {
         "feels_like" : 277.38,
         "grnd_level" : 1025,
         "pressure" : 1025,
         "temp" : 281.54000000000002,
         "temp_min" : 281.54000000000002,
         "sea_level" : 1025,
         "humidity" : 90,
         "temp_kf" : 0,
         "temp_max" : 281.54000000000002
       },
       "dt_txt" : "2020-04-30 15:00:00",
       "wind" : {
         "speed" : 4.8899999999999997,
         "deg" : 128
       },
       "weather" : [
         {
           "icon" : "10d",
           "id" : 500,
           "main" : "Rain",
           "description" : "light rain"
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588258800,
       "sys" : {
         "pod" : "d"
       },
       "rain" : {
         "3h" : 1
       }
     },
     {
       "main" : {
         "feels_like" : 278.56,
         "temp_max" : 282.5,
         "temp_kf" : 0,
         "pressure" : 1024,
         "temp" : 282.5,
         "temp_min" : 282.5,
         "grnd_level" : 1023,
         "humidity" : 92,
         "sea_level" : 1024
       },
       "dt_txt" : "2020-04-30 18:00:00",
       "wind" : {
         "speed" : 5.0099999999999998,
         "deg" : 138
       },
       "weather" : [
         {
           "description" : "light rain",
           "main" : "Rain",
           "icon" : "10d",
           "id" : 500
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588269600,
       "sys" : {
         "pod" : "d"
       },
       "rain" : {
         "3h" : 1.1799999999999999
       }
     },
     {
       "main" : {
         "pressure" : 1020,
         "temp_max" : 284.23000000000002,
         "temp_kf" : 0,
         "humidity" : 89,
         "grnd_level" : 1019,
         "sea_level" : 1020,
         "feels_like" : 280.25,
         "temp" : 284.23000000000002,
         "temp_min" : 284.23000000000002
       },
       "dt_txt" : "2020-04-30 21:00:00",
       "wind" : {
         "speed" : 5.5,
         "deg" : 142
       },
       "weather" : [
         {
           "main" : "Rain",
           "id" : 500,
           "icon" : "10d",
           "description" : "light rain"
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588280400,
       "sys" : {
         "pod" : "d"
       },
       "rain" : {
         "3h" : 0.31
       }
     },
     {
       "main" : {
         "feels_like" : 280.51999999999998,
         "temp_kf" : 0,
         "pressure" : 1020,
         "temp" : 284.39999999999998,
         "temp_max" : 284.39999999999998,
         "temp_min" : 284.39999999999998,
         "sea_level" : 1020,
         "humidity" : 88,
         "grnd_level" : 1019
       },
       "dt_txt" : "2020-05-01 00:00:00",
       "wind" : {
         "speed" : 5.3499999999999996,
         "deg" : 141
       },
       "weather" : [
         {
           "id" : 804,
           "icon" : "04n",
           "main" : "Clouds",
           "description" : "overcast clouds"
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588291200,
       "sys" : {
         "pod" : "n"
       }
     },
     {
       "main" : {
         "sea_level" : 1017,
         "grnd_level" : 1017,
         "temp_max" : 284.18000000000001,
         "feels_like" : 280.43000000000001,
         "temp_min" : 284.18000000000001,
         "humidity" : 89,
         "pressure" : 1017,
         "temp" : 284.18000000000001,
         "temp_kf" : 0
       },
       "dt_txt" : "2020-05-01 03:00:00",
       "wind" : {
         "speed" : 5.1500000000000004,
         "deg" : 134
       },
       "weather" : [
         {
           "icon" : "04n",
           "main" : "Clouds",
           "description" : "broken clouds",
           "id" : 803
         }
       ],
       "clouds" : {
         "all" : 84
       },
       "dt" : 1588302000,
       "sys" : {
         "pod" : "n"
       }
     },
     {
       "main" : {
         "temp_kf" : 0,
         "grnd_level" : 1013,
         "humidity" : 87,
         "temp" : 285.61000000000001,
         "temp_min" : 285.61000000000001,
         "temp_max" : 285.61000000000001,
         "feels_like" : 281.26999999999998,
         "sea_level" : 1013,
         "pressure" : 1013
       },
       "dt_txt" : "2020-05-01 06:00:00",
       "wind" : {
         "speed" : 6.4100000000000001,
         "deg" : 134
       },
       "weather" : [
         {
           "icon" : "04n",
           "main" : "Clouds",
           "id" : 804,
           "description" : "overcast clouds"
         }
       ],
       "clouds" : {
         "all" : 91
       },
       "dt" : 1588312800,
       "sys" : {
         "pod" : "n"
       }
     },
     {
       "main" : {
         "feels_like" : 280.94999999999999,
         "sea_level" : 1010,
         "temp_max" : 286.26999999999998,
         "temp" : 286.26999999999998,
         "humidity" : 92,
         "temp_min" : 286.26999999999998,
         "temp_kf" : 0,
         "pressure" : 1010,
         "grnd_level" : 1009
       },
       "dt_txt" : "2020-05-01 09:00:00",
       "wind" : {
         "speed" : 8.4199999999999999,
         "deg" : 148
       },
       "weather" : [
         {
           "main" : "Rain",
           "id" : 501,
           "description" : "moderate rain",
           "icon" : "10n"
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588323600,
       "sys" : {
         "pod" : "n"
       },
       "rain" : {
         "3h" : 7.0199999999999996
       }
     },
     {
       "main" : {
         "grnd_level" : 1008,
         "temp_kf" : 0,
         "feels_like" : 281.94999999999999,
         "humidity" : 92,
         "pressure" : 1008,
         "temp" : 286.97000000000003,
         "sea_level" : 1008,
         "temp_min" : 286.97000000000003,
         "temp_max" : 286.97000000000003
       },
       "dt_txt" : "2020-05-01 12:00:00",
       "wind" : {
         "speed" : 8.3000000000000007,
         "deg" : 157
       },
       "weather" : [
         {
           "description" : "moderate rain",
           "icon" : "10d",
           "id" : 501,
           "main" : "Rain"
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588334400,
       "sys" : {
         "pod" : "d"
       },
       "rain" : {
         "3h" : 7.6399999999999997
       }
     },
     {
       "main" : {
         "feels_like" : 283.51999999999998,
         "humidity" : 93,
         "temp_min" : 287.25999999999999,
         "grnd_level" : 1006,
         "sea_level" : 1006,
         "temp" : 287.25999999999999,
         "temp_max" : 287.25999999999999,
         "temp_kf" : 0,
         "pressure" : 1006
       },
       "dt_txt" : "2020-05-01 15:00:00",
       "wind" : {
         "speed" : 6.6799999999999997,
         "deg" : 155
       },
       "weather" : [
         {
           "icon" : "10d",
           "description" : "light rain",
           "main" : "Rain",
           "id" : 500
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588345200,
       "sys" : {
         "pod" : "d"
       },
       "rain" : {
         "3h" : 1.98
       }
     },
     {
       "main" : {
         "temp_min" : 289.45999999999998,
         "temp" : 289.45999999999998,
         "humidity" : 84,
         "temp_max" : 289.45999999999998,
         "sea_level" : 1004,
         "grnd_level" : 1003,
         "temp_kf" : 0,
         "pressure" : 1004,
         "feels_like" : 288.12
       },
       "dt_txt" : "2020-05-01 18:00:00",
       "wind" : {
         "speed" : 3.5299999999999998,
         "deg" : 183
       },
       "weather" : [
         {
           "id" : 500,
           "icon" : "10d",
           "description" : "light rain",
           "main" : "Rain"
         }
       ],
       "clouds" : {
         "all" : 100
       },
       "dt" : 1588356000,
       "sys" : {
         "pod" : "d"
       },
       "rain" : {
         "3h" : 0.27000000000000002
       }
     },
     {
       "main" : {
         "humidity" : 70,
         "temp_min" : 290.85000000000002,
         "grnd_level" : 1002,
         "temp" : 290.85000000000002,
         "temp_kf" : 0,
         "pressure" : 1003,
         "temp_max" : 290.85000000000002,
         "feels_like" : 288.13,
         "sea_level" : 1003
       },
       "dt_txt" : "2020-05-01 21:00:00",
       "wind" : {
         "speed" : 4.8399999999999999,
         "deg" : 178
       },
       "weather" : [
         {
           "main" : "Rain",
           "id" : 500,
           "description" : "light rain",
           "icon" : "10d"
         }
       ],
       "clouds" : {
         "all" : 77
       },
       "dt" : 1588366800,
       "sys" : {
         "pod" : "d"
       },
       "rain" : {
         "3h" : 0.14999999999999999
       }
     },
     {
       "main" : {
         "temp_min" : 284.69999999999999,
         "sea_level" : 1003,
         "temp_max" : 284.69999999999999,
         "humidity" : 81,
         "temp" : 284.69999999999999,
         "temp_kf" : 0,
         "feels_like" : 282.11000000000001,
         "grnd_level" : 1003,
         "pressure" : 1003
       },
       "dt_txt" : "2020-05-02 00:00:00",
       "wind" : {
         "speed" : 3.1699999999999999,
         "deg" : 195
       },
       "weather" : [
         {
           "description" : "scattered clouds",
           "id" : 802,
           "main" : "Clouds",
           "icon" : "03n"
         }
       ],
       "clouds" : {
         "all" : 38
       },
       "dt" : 1588377600,
       "sys" : {
         "pod" : "n"
       }
     },
     {
       "wind" : {
         "speed" : 2.4300000000000002,
         "deg" : 182
       },
       "main" : {
         "grnd_level" : 1003,
         "sea_level" : 1004,
         "temp_kf" : 0,
         "temp" : 282.16000000000003,
         "temp_max" : 282.16000000000003,
         "humidity" : 91,
         "pressure" : 1004,
         "temp_min" : 282.16000000000003,
         "feels_like" : 279.89999999999998
       },
       "dt_txt" : "2020-05-02 03:00:00",
       "sys" : {
         "pod" : "n"
       },
       "dt" : 1588388400,
       "clouds" : {
         "all" : 0
       },
       "weather" : [
         {
           "description" : "clear sky",
           "icon" : "01n",
           "id" : 800,
           "main" : "Clear"
         }
       ]
     },
     {
       "wind" : {
         "speed" : 1.7,
         "deg" : 204
       },
       "main" : {
         "grnd_level" : 1001,
         "sea_level" : 1002,
         "pressure" : 1002,
         "temp" : 281.35000000000002,
         "feels_like" : 279.49000000000001,
         "temp_kf" : 0,
         "humidity" : 93,
         "temp_min" : 281.35000000000002,
         "temp_max" : 281.35000000000002
       },
       "dt_txt" : "2020-05-02 06:00:00",
       "sys" : {
         "pod" : "n"
       },
       "dt" : 1588399200,
       "clouds" : {
         "all" : 2
       },
       "weather" : [
         {
           "id" : 800,
           "description" : "clear sky",
           "icon" : "01n",
           "main" : "Clear"
         }
       ]
     },
     {
       "wind" : {
         "speed" : 1.8100000000000001,
         "deg" : 284
       },
       "main" : {
         "temp_min" : 281.14999999999998,
         "temp_kf" : 0,
         "temp_max" : 281.14999999999998,
         "temp" : 281.14999999999998,
         "pressure" : 1002,
         "sea_level" : 1002,
         "feels_like" : 279.17000000000002,
         "grnd_level" : 1001,
         "humidity" : 93
       },
       "dt_txt" : "2020-05-02 09:00:00",
       "sys" : {
         "pod" : "n"
       },
       "dt" : 1588410000,
       "clouds" : {
         "all" : 36
       },
       "weather" : [
         {
           "icon" : "03n",
           "description" : "scattered clouds",
           "id" : 802,
           "main" : "Clouds"
         }
       ]
     },
     {
       "wind" : {
         "speed" : 5.75,
         "deg" : 333
       },
       "main" : {
         "humidity" : 81,
         "temp_kf" : 0,
         "sea_level" : 1004,
         "pressure" : 1004,
         "feels_like" : 280.81999999999999,
         "temp" : 285.11000000000001,
         "temp_max" : 285.11000000000001,
         "grnd_level" : 1003,
         "temp_min" : 285.11000000000001
       },
       "dt_txt" : "2020-05-02 12:00:00",
       "rain" : {
         "3h" : 0.68000000000000005
       },
       "sys" : {
         "pod" : "d"
       },
       "dt" : 1588420800,
       "clouds" : {
         "all" : 68
       },
       "weather" : [
         {
           "icon" : "10d",
           "description" : "light rain",
           "id" : 500,
           "main" : "Rain"
         }
       ]
     },
     {
       "wind" : {
         "deg" : 337,
         "speed" : 5.7000000000000002
       },
       "main" : {
         "feels_like" : 281.66000000000003,
         "temp_kf" : 0,
         "sea_level" : 1006,
         "temp_max" : 286.69,
         "humidity" : 58,
         "grnd_level" : 1005,
         "pressure" : 1006,
         "temp" : 286.69,
         "temp_min" : 286.69
       },
       "dt_txt" : "2020-05-02 15:00:00",
       "sys" : {
         "pod" : "d"
       },
       "dt" : 1588431600,
       "clouds" : {
         "all" : 73
       },
       "weather" : [
         {
           "icon" : "04d",
           "description" : "broken clouds",
           "id" : 803,
           "main" : "Clouds"
         }
       ]
     },
     {
       "wind" : {
         "deg" : 327,
         "speed" : 5.3899999999999997
       },
       "main" : {
         "feels_like" : 286.05000000000001,
         "temp_max" : 291.17000000000002,
         "temp_kf" : 0,
         "humidity" : 39,
         "temp_min" : 291.17000000000002,
         "pressure" : 1007,
         "grnd_level" : 1006,
         "sea_level" : 1007,
         "temp" : 291.17000000000002
       },
       "dt_txt" : "2020-05-02 18:00:00",
       "sys" : {
         "pod" : "d"
       },
       "dt" : 1588442400,
       "clouds" : {
         "all" : 57
       },
       "weather" : [
         {
           "icon" : "04d",
           "description" : "broken clouds",
           "id" : 803,
           "main" : "Clouds"
         }
       ]
     },
     {
       "wind" : {
         "speed" : 5.7599999999999998,
         "deg" : 322
       },
       "main" : {
         "temp_min" : 290.92000000000002,
         "grnd_level" : 1006,
         "temp" : 290.92000000000002,
         "temp_max" : 290.92000000000002,
         "pressure" : 1007,
         "temp_kf" : 0,
         "feels_like" : 285.23000000000002,
         "sea_level" : 1007,
         "humidity" : 35
       },
       "dt_txt" : "2020-05-02 21:00:00",
       "sys" : {
         "pod" : "d"
       },
       "dt" : 1588453200,
       "clouds" : {
         "all" : 1
       },
       "weather" : [
         {
           "icon" : "01d",
           "description" : "clear sky",
           "id" : 800,
           "main" : "Clear"
         }
       ]
     },
     {
       "wind" : {
         "deg" : 334,
         "speed" : 2.8300000000000001
       },
       "main" : {
         "grnd_level" : 1008,
         "feels_like" : 282.19,
         "temp_min" : 285.63999999999999,
         "temp_kf" : 0,
         "humidity" : 53,
         "pressure" : 1009,
         "temp" : 285.63999999999999,
         "sea_level" : 1009,
         "temp_max" : 285.63999999999999
       },
       "dt_txt" : "2020-05-03 00:00:00",
       "sys" : {
         "pod" : "n"
       },
       "dt" : 1588464000,
       "clouds" : {
         "all" : 20
       },
       "weather" : [
         {
           "icon" : "02n",
           "description" : "few clouds",
           "id" : 801,
           "main" : "Clouds"
         }
       ]
     },
     {
       "wind" : {
         "speed" : 1.9199999999999999,
         "deg" : 311
       },
       "main" : {
         "feels_like" : 280.12,
         "pressure" : 1011,
         "temp_max" : 282.85000000000002,
         "humidity" : 66,
         "grnd_level" : 1010,
         "temp_kf" : 0,
         "temp" : 282.85000000000002,
         "temp_min" : 282.85000000000002,
         "sea_level" : 1011
       },
       "dt_txt" : "2020-05-03 03:00:00",
       "sys" : {
         "pod" : "n"
       },
       "dt" : 1588474800,
       "clouds" : {
         "all" : 19
       },
       "weather" : [
         {
           "icon" : "02n",
           "description" : "few clouds",
           "id" : 801,
           "main" : "Clouds"
         }
       ]
     },
     {
       "wind" : {
         "speed" : 2.7599999999999998,
         "deg" : 284
       },
       "main" : {
         "grnd_level" : 1011,
         "sea_level" : 1011,
         "humidity" : 71,
         "temp_min" : 281.38,
         "feels_like" : 278,
         "pressure" : 1011,
         "temp_max" : 281.38,
         "temp" : 281.38,
         "temp_kf" : 0
       },
       "dt_txt" : "2020-05-03 06:00:00",
       "sys" : {
         "pod" : "n"
       },
       "dt" : 1588485600,
       "clouds" : {
         "all" : 26
       },
       "weather" : [
         {
           "icon" : "03n",
           "description" : "scattered clouds",
           "id" : 802,
           "main" : "Clouds"
         }
       ]
     },
     {
       "wind" : {
         "speed" : 2.6499999999999999,
         "deg" : 285
       },
       "main" : {
         "grnd_level" : 1010,
         "temp" : 280.30000000000001,
         "sea_level" : 1011,
         "temp_kf" : 0,
         "temp_max" : 280.30000000000001,
         "temp_min" : 280.30000000000001,
         "pressure" : 1011,
         "feels_like" : 276.91000000000003,
         "humidity" : 74
       },
       "dt_txt" : "2020-05-03 09:00:00",
       "sys" : {
         "pod" : "n"
       },
       "dt" : 1588496400,
       "clouds" : {
         "all" : 17
       },
       "weather" : [
         {
           "icon" : "02n",
           "description" : "few clouds",
           "id" : 801,
           "main" : "Clouds"
         }
       ]
     },
     {
       "wind" : {
         "deg" : 279,
         "speed" : 2.7599999999999998
       },
       "main" : {
         "humidity" : 58,
         "feels_like" : 280.85000000000002,
         "temp_kf" : 0,
         "pressure" : 1011,
         "grnd_level" : 1011,
         "sea_level" : 1011,
         "temp" : 284.25999999999999,
         "temp_max" : 284.25999999999999,
         "temp_min" : 284.25999999999999
       },
       "dt_txt" : "2020-05-03 12:00:00",
       "sys" : {
         "pod" : "d"
       },
       "dt" : 1588507200,
       "clouds" : {
         "all" : 44
       },
       "weather" : [
         {
           "icon" : "03d",
           "description" : "scattered clouds",
           "id" : 802,
           "main" : "Clouds"
         }
       ]
     },
     {
       "wind" : {
         "speed" : 3.1099999999999999,
         "deg" : 276
       },
       "main" : {
         "temp_max" : 290.88,
         "humidity" : 35,
         "temp_min" : 290.88,
         "temp_kf" : 0,
         "grnd_level" : 1010,
         "pressure" : 1011,
         "temp" : 290.88,
         "feels_like" : 287.04000000000002,
         "sea_level" : 1011
       },
       "dt_txt" : "2020-05-03 15:00:00",
       "sys" : {
         "pod" : "d"
       },
       "dt" : 1588518000,
       "clouds" : {
         "all" : 36
       },
       "weather" : [
         {
           "icon" : "03d",
           "description" : "scattered clouds",
           "id" : 802,
           "main" : "Clouds"
         }
       ]
     },
     {
       "wind" : {
         "speed" : 3.4900000000000002,
         "deg" : 276
       },
       "main" : {
         "grnd_level" : 1009,
         "humidity" : 35,
         "temp" : 293.91000000000003,
         "temp_kf" : 0,
         "sea_level" : 1009,
         "feels_like" : 290.29000000000002,
         "temp_min" : 293.91000000000003,
         "temp_max" : 293.91000000000003,
         "pressure" : 1009
       },
       "dt_txt" : "2020-05-03 18:00:00",
       "sys" : {
         "pod" : "d"
       },
       "dt" : 1588528800,
       "clouds" : {
         "all" : 18
       },
       "weather" : [
         {
           "icon" : "02d",
           "description" : "few clouds",
           "id" : 801,
           "main" : "Clouds"
         }
       ]
     },
     {
       "wind" : {
         "speed" : 3.5,
         "deg" : 247
       },
       "main" : {
         "feels_like" : 290.73000000000002,
         "temp_max" : 293.94999999999999,
         "humidity" : 40,
         "pressure" : 1007,
         "temp" : 293.94999999999999,
         "temp_min" : 293.94999999999999,
         "grnd_level" : 1007,
         "temp_kf" : 0,
         "sea_level" : 1007
       },
       "dt_txt" : "2020-05-03 21:00:00",
       "sys" : {
         "pod" : "d"
       },
       "dt" : 1588539600,
       "clouds" : {
         "all" : 8
       },
       "weather" : [
         {
           "icon" : "01d",
           "description" : "clear sky",
           "id" : 800,
           "main" : "Clear"
         }
       ]
     }
   ],
   "message" : 0,
   "cnt" : 40,
   "city" : {
     "population" : 178042,
     "sunrise" : 1588067114,
     "sunset" : 1588117239,
     "id" : 5224151,
     "name" : "Providence",
     "country" : "US",
     "timezone" : -14400,
     "coord" : {
       "lat" : 41.823999999999998,
       "lon" : -71.412800000000004
     }
   },
   "cod" : "200"
 }

 
 */
