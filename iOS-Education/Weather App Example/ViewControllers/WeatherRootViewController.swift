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

    @IBOutlet weak var cityDescriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var sunriseSunsetLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentLocationManager.shared.requestLocationWithDelegate(self)
        title = "Current Weather"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(getLocationFix))
        clearUI()
    }
    
    @IBAction func showWeatherForecastAction(_ sender: Any) {
        let weatherForecastViewController = WeatherForecastViewController(nibName: "WeatherForecastViewController", bundle: nil)
        navigationController?.pushViewController(weatherForecastViewController, animated: true)
    }
    
    @objc func getLocationFix() {
        CurrentLocationManager.shared.requestLocation()
    }
    
    func updateUIWith(_ weatherData: WeatherData) {
        
        if let name = weatherData.name, let temperatureInFahrenheit = weatherData.temperatureInFahrenheit, let weatherDescription = weatherData.weatherDescription {
            cityDescriptionLabel.text = name + " " + String(format: "%2.f˚", temperatureInFahrenheit) + " " + weatherDescription
        }
        
        if let url = weatherData.iconURL {
            if let data = try? Data(contentsOf: url) {
                iconImageView.image = UIImage(data: data)
            }
        }
        
        if let sunrise = weatherData.sunrise, let sunset = weatherData.sunset {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .medium
            
            let sunriseString = dateFormatter.string(from: sunrise)
            let sunsetString = dateFormatter.string(from: sunset)
            
            sunriseSunsetLabel.text = "Sunrise: \(sunriseString)\n" + "Sunset: \(sunsetString)"
        }
        
        if let humidity = weatherData.humidity {
            humidityLabel.text = String(format: "%2.f%% Humidity", humidity)
        }
        
        if let timestamp = weatherData.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .long
            timeLabel.text = dateFormatter.string(from: timestamp)
        }
    }
    
    func clearUI() {
        self.cityDescriptionLabel.text = "-----"
        self.sunriseSunsetLabel.text = "-----"
        self.humidityLabel.text = "-----"
        self.timeLabel.text = "-----"
        self.iconImageView.image = nil
    }
}

extension WeatherRootViewController: CurrentLocationManagerDelegate {
    
    func didUpdateLocation(location: CLLocation) {
        WeatherDataManager.shared.getWeatherFor(coordinate: location.coordinate) { (weather) in
            
            if let weatherData = weather {
                self.updateUIWith(weatherData)
            }
            else {
                // show error
            }
        }
    }
    
    func didFailWithError(error: Error) {
        
    }
}
