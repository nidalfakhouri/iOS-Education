//
//  WeatherRootViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/14/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentLocationManager.shared.delegate = self
    }
    
    func showWeatherForecast() {
         let weatherForecastViewController = WeatherForecastViewController(nibName: "WeatherForecastViewController", bundle: nil)
        navigationController?.pushViewController(weatherForecastViewController, animated: true)
    }
}

extension WeatherRootViewController: CurrentLocationManagerDelegate {
    
    func didUpdateLocation(location: CLLocation) {
        WeatherDataManager.shared.getWeatherFor(coordinate: location.coordinate) { (weather) in
            
        }
    }
}
