//
//  NSURLSessionExampleViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/14/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

class NSURLSessionExampleViewController: UIViewController {

    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    // make sure to add the transport security settings to your plist
    //https://stackoverflow.com/questions/31254725/transport-security-has-blocked-a-cleartext-http
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "NSURLSession"

        dataTask?.cancel()
        
        let urlString = "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&APPID=\(WeatherDataManager.shared.APPID)"
        
        if let url = URL(string: urlString) {

            dataTask = defaultSession.dataTask(with: url) { data, response, error in

                if let error = error {
                    let errorMessage = "DataTask error: " + error.localizedDescription + "\n"
                    print(errorMessage)
                }
                else if let data = data,
                        let response = response as? HTTPURLResponse,
                        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                        response.statusCode == 200
                {
                    print(json)
                }
            }
            
            dataTask?.resume()
        }
    }
}
