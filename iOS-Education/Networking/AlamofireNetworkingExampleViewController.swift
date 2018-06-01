//
//  AlamofireNetworkingExampleViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/14/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AlamofireNetworkingExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Alamofire"
        
        let urlString = "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&APPID=\(WeatherDataManager.shared.APPID)"
        
        Alamofire.request(urlString).responseJSON { (responseData) -> Void in
            if let data = responseData.result.value {
                let swiftyJsonVar = JSON(data)
                print(swiftyJsonVar)
                print("--------------------")
                
                /*
                let temp = swiftyJsonVar["main"]["temp"]
                print(temp)
                print("--------------------")
                */
                
                let weather = WeatherData(json: swiftyJsonVar)
                print(weather.description)
                
            }
        }
    }
}
