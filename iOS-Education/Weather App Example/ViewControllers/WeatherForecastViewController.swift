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
    @IBOutlet weak var loadingActivityIndicatorView: UIActivityIndicatorView!
    var forecasts: [WeatherData] = [WeatherData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "5 Day Forecast"
        CurrentLocationManager.shared.requestLocationWithDelegate(self)
        self.tableView.register(UINib(nibName: "WeatherDataTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherDataTableViewCell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(getLocationFix))
    }
    
    @objc func getLocationFix() {
        CurrentLocationManager.shared.requestLocation()
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
        return 112 // pulled from the xib height
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
            
            self.loadingActivityIndicatorView.stopAnimating()
            self.tableView.isHidden = false
            
            if let forecasts = forecasts {
                self.forecasts = forecasts
                self.tableView.reloadData()
            }
            else {
                // show alert
                let alert = UIAlertController.init(title: "Network Error", message: "There was a problem loading the weather for your current location", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .destructive, handler: { (action) in
                    self.dismiss(animated: true, completion: nil)
                })
                
                // could add multiple of these
                alert.addAction(alertAction)
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func didFailWithError(error: Error) {
        
    }
}
