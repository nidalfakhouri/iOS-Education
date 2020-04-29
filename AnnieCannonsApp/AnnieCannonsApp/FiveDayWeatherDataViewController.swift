//
//  FiveDayWeatherDataViewController.swift
//  AnnieCannonsApp
//
//  Created by Nidal Fakhouri on 4/28/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import UIKit

class FiveDayWeatherDataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var weatherData = [CurrentWeatherData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // 1 get5DayWeatherData
        WeatherDataManager.shared.get5DayWeatherData { (currentWeatherDataArray: [CurrentWeatherData]) in
            
            // ui can only be updated from the main thread
            DispatchQueue.main.async {
                self.weatherData = currentWeatherDataArray
                self.tableView.reloadData()
            }
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension FiveDayWeatherDataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let currentWeatherData = weatherData[indexPath.row]
        cell.textLabel?.text = currentWeatherData.tempString
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
    }
}
