//
//  WeatherForecastViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 6/1/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherForecastViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var forecasts: [WeatherData] = [WeatherData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentLocationManager.shared.delegate = self
        self.tableView.register(UINib(nibName: "WeatherDataTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherDataTableViewCell")
    }
}

extension WeatherForecastViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92 // pulled from the xib height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: WeatherDataTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "WeatherDataTableViewCell", for: indexPath) as! WeatherDataTableViewCell
        
        let weather = forecasts[indexPath.row]
        cell.configure(weather)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
    }
}

extension WeatherForecastViewController: CurrentLocationManagerDelegate {
    
    func didUpdateLocation(location: CLLocation) {
        WeatherDataManager.shared.get5DayWeatherForecastFor(coordinate: location.coordinate) { (forecasts) in
            if let forecasts = forecasts {
                self.forecasts = forecasts
                self.tableView.reloadData()
            }
            else {
                // show alert
            }
        }
    }
}
